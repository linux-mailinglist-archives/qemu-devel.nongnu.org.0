Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 24484442B20
	for <lists+qemu-devel@lfdr.de>; Tue,  2 Nov 2021 10:56:04 +0100 (CET)
Received: from localhost ([::1]:40414 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mhqWR-0000Lg-54
	for lists+qemu-devel@lfdr.de; Tue, 02 Nov 2021 05:56:03 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51258)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <damien.hedde@greensocs.com>)
 id 1mhqSS-0006Du-MU
 for qemu-devel@nongnu.org; Tue, 02 Nov 2021 05:51:56 -0400
Received: from beetle.greensocs.com ([5.135.226.135]:46778)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <damien.hedde@greensocs.com>)
 id 1mhqSQ-0003LF-OM
 for qemu-devel@nongnu.org; Tue, 02 Nov 2021 05:51:56 -0400
Received: from [192.168.15.140] (unknown [195.68.53.70])
 by beetle.greensocs.com (Postfix) with ESMTPSA id EBFC12077D;
 Tue,  2 Nov 2021 09:51:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=greensocs.com;
 s=mail; t=1635846713;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=zoAe6lZbSZY82yiQ77T4w96bpwhKqUQXS5D2Hl1IhdY=;
 b=Grqk5cZVklrO5Ra4FQA+acCK8r4PFfNbSo1K4/2ie5A4QZXiX6aezumfrUxOHrJ0zEqPug
 m2E2uhn+4eoTZsd0inIqQuLwigglI96w6I+ZooxabsyCJrOwhA63Mq9vqKIoqtKz/+Si5p
 c5L7GFWPqX1+Vh0/13yrqD+W++FXwBM=
Message-ID: <dd5b1f66-e06d-bfb3-9927-1f8a59255769@greensocs.com>
Date: Tue, 2 Nov 2021 10:51:52 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.1.2
Subject: Re: [PATCH 0/5] hw/core: Remove uses of obsolete QERR_ definitions
Content-Language: en-US-large
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>,
 qemu-devel@nongnu.org
References: <20211029230147.2465055-1-philmd@redhat.com>
From: Damien Hedde <damien.hedde@greensocs.com>
In-Reply-To: <20211029230147.2465055-1-philmd@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=5.135.226.135;
 envelope-from=damien.hedde@greensocs.com; helo=beetle.greensocs.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-1.14,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: =?UTF-8?Q?Daniel_P=2e_Berrang=c3=a9?= <berrange@redhat.com>,
 Eduardo Habkost <ehabkost@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Markus Armbruster <armbru@redhat.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>



On 10/30/21 01:01, Philippe Mathieu-Daudé wrote:
> QERR_ definitions are obsolete since 2015... Remove their
> uses in hw/core/.
> 
> Philippe Mathieu-Daudé (5):
>    hw/core: Remove use of QERR_UNSUPPORTED
>    hw/core: Remove use of QERR_FEATURE_DISABLED
>    hw/core: Remove uses of QERR_DEVICE_NO_HOTPLUG
>    hw/core: Remove uses of QERR_PROPERTY_VALUE_BAD
>    hw/core: Remove uses of QERR_INVALID_PARAMETER_VALUE
> 
>   include/qapi/qmp/qerror.h        | 6 ------
>   hw/core/machine-qmp-cmds.c       | 3 ++-
>   hw/core/nmi.c                    | 2 +-
>   hw/core/qdev-properties-system.c | 2 +-
>   hw/core/qdev-properties.c        | 2 +-
>   hw/core/qdev.c                   | 3 ++-
>   monitor/misc.c                   | 3 +--
>   softmmu/cpus.c                   | 3 +--
>   softmmu/qdev-monitor.c           | 9 ++++-----
>   target/i386/cpu.c                | 2 +-
>   10 files changed, 14 insertions(+), 21 deletions(-)
> 

Hi Philippe,

In my patches you just pulled (patch 9). There is a new 
QERR_INVALID_PARAMETER_VALUE in qdev-monitor.c. Maybe it is worth
fixing it as well.

anyway
Reviewed-by: Damien Hedde <damien.hedde@greensocs.com>

Thanks,
Damien

