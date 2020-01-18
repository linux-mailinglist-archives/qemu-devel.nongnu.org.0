Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D1A5A14169F
	for <lists+qemu-devel@lfdr.de>; Sat, 18 Jan 2020 09:46:54 +0100 (CET)
Received: from localhost ([::1]:38314 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1isjkr-0006N1-Gm
	for lists+qemu-devel@lfdr.de; Sat, 18 Jan 2020 03:46:53 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:40824)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <hpoussin@reactos.org>) id 1isjjr-0005TW-4z
 for qemu-devel@nongnu.org; Sat, 18 Jan 2020 03:45:51 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <hpoussin@reactos.org>) id 1isjjq-0007qI-8n
 for qemu-devel@nongnu.org; Sat, 18 Jan 2020 03:45:51 -0500
Received: from iserv.reactos.org ([2a01:4f8:1c17:5ae1::1]:59104)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <hpoussin@reactos.org>)
 id 1isjjl-0007mU-SA; Sat, 18 Jan 2020 03:45:46 -0500
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=reactos.org
 ; s=25047;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:MIME-Version:
 Date:Message-ID:From:References:Cc:To:Subject:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=lx6kJFysSifbTqbAKwSAeN9WXZM7/BMuuriy5epLnP0=; b=r6US2RMPCHbbBnPfamRvZ2m9LU
 m4yIYDtHePimL7ODB/eeQ8hAQm5Kxm8MNwztRBUIpZVHjEDeLNb0sWkbqRK+Hy1eVZk+4QtzKnJZ0
 jwmv0fO6NA6u+N1BzIyI251WLPsefG25SZoF8E2DcUGROTlyu9if1ZuXr9lX8r4R43Qs=;
Received: from [2a01:e35:2e3e:3c40:c9de:bd98:d002:fc16]
 by iserv.reactos.org with esmtpsa (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.92) (envelope-from <hpoussin@reactos.org>)
 id 1isjjh-0002tV-Kr; Sat, 18 Jan 2020 08:45:42 +0000
Subject: Re: [PATCH v3 0/2] hw/timer/m48t59: Convert to trace events
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>,
 qemu-devel@nongnu.org, qemu-trivial@nongnu.org
References: <20200117165809.31067-1-philmd@redhat.com>
From: =?UTF-8?Q?Herv=c3=a9_Poussineau?= <hpoussin@reactos.org>
Message-ID: <90e72705-7f40-eed4-30a9-df76d07811d3@reactos.org>
Date: Sat, 18 Jan 2020 09:45:40 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.3.0
MIME-Version: 1.0
In-Reply-To: <20200117165809.31067-1-philmd@redhat.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2a01:4f8:1c17:5ae1::1
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: qemu-ppc@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Le 17/01/2020 à 17:58, Philippe Mathieu-Daudé a écrit :
> Another trivial cleanup series.
> 
> v2: Rebased on 4.2
> 
> Philippe Mathieu-Daudé (2):
>    MAINTAINERS: Add missing m48t59 files to the PReP section
>    hw/timer/m48t59: Convert debug printf()s to trace events
> 
>   hw/rtc/m48t59-internal.h |  5 -----
>   hw/rtc/m48t59.c          | 11 +++++------
>   MAINTAINERS              |  2 ++
>   hw/rtc/trace-events      |  6 ++++++
>   4 files changed, 13 insertions(+), 11 deletions(-)
> 

Reviewed-by: Hervé Poussineau <hpoussin@reactos.org>

