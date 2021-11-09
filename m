Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E61AD44B013
	for <lists+qemu-devel@lfdr.de>; Tue,  9 Nov 2021 16:09:57 +0100 (CET)
Received: from localhost ([::1]:35824 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mkSl2-0006fS-Ty
	for lists+qemu-devel@lfdr.de; Tue, 09 Nov 2021 10:09:57 -0500
Received: from eggs.gnu.org ([209.51.188.92]:51646)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <damien.hedde@greensocs.com>)
 id 1mkSfz-0004eI-KZ
 for qemu-devel@nongnu.org; Tue, 09 Nov 2021 10:04:44 -0500
Received: from beetle.greensocs.com ([5.135.226.135]:60838)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <damien.hedde@greensocs.com>)
 id 1mkSfw-00005Y-Si
 for qemu-devel@nongnu.org; Tue, 09 Nov 2021 10:04:43 -0500
Received: from [192.168.12.10] (unknown [195.68.53.70])
 by beetle.greensocs.com (Postfix) with ESMTPSA id 32C1921C32;
 Tue,  9 Nov 2021 15:04:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=greensocs.com;
 s=mail; t=1636470274;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=ma5uycb8i9ruMO7Pn2OgHlz/UHy8+SvEykVHq//n8j0=;
 b=3asacmR3fSBnW8x8o77hQRWbjNhLn6f40CUoD6ySyHVGNVl/KobaXTbAWLD458kJLmaqzW
 56qZfbq37FJvStgAA8QETzf62DIAxF8QLu7c3U7JZUR94EcTIj9vzr0hnV5L8MzBoV/fGn
 JKn7oVk63Y1/G9zPpAN4oHfd47QEkuQ=
Message-ID: <aea27bdd-84bc-6280-335b-0ece00e8931c@greensocs.com>
Date: Tue, 9 Nov 2021 16:04:33 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.1.2
Subject: Re: [PATCH] qapi: Belatedly mark unstable QMP parts with feature
 'unstable'
Content-Language: en-US-large
To: Markus Armbruster <armbru@redhat.com>, qemu-devel@nongnu.org
References: <20211109145559.2122827-1-armbru@redhat.com>
From: Damien Hedde <damien.hedde@greensocs.com>
In-Reply-To: <20211109145559.2122827-1-armbru@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=5.135.226.135;
 envelope-from=damien.hedde@greensocs.com; helo=beetle.greensocs.com
X-Spam_score_int: -54
X-Spam_score: -5.5
X-Spam_bar: -----
X-Spam_report: (-5.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-3.364,
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
Cc: berrange@redhat.com, eblake@redhat.com, ehabkost@redhat.com,
 philmd@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>



On 11/9/21 15:55, Markus Armbruster wrote:
> The work in merge commit e86e00a2493 lacks special feature flag
> 'unstable', because it raced with it.  Add it where it's missing.
> 
> Signed-off-by: Markus Armbruster <armbru@redhat.com>

Reviewed-by: Damien Hedde <damien.hedde@greensocs.com>

