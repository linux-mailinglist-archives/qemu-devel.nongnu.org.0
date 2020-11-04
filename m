Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C76882A62F8
	for <lists+qemu-devel@lfdr.de>; Wed,  4 Nov 2020 12:11:31 +0100 (CET)
Received: from localhost ([::1]:45220 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kaGhO-0004Er-R4
	for lists+qemu-devel@lfdr.de; Wed, 04 Nov 2020 06:11:30 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:49424)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1kaGeZ-0002RP-Ds
 for qemu-devel@nongnu.org; Wed, 04 Nov 2020 06:08:35 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:58554)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1kaGeX-0007lu-RI
 for qemu-devel@nongnu.org; Wed, 04 Nov 2020 06:08:35 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1604488113;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=pH9Xoq+j1evkR74J8wYbao1BTdRbLk1a0G4yKTz8bqk=;
 b=LPc/ZvoJ4KZEnOjavEIZKZGU6Lv0gYoEvAniNmrWK4KFTpuv415xZjBzrjr7M3tHzycsnF
 TBIvo3fc9txWyi2vT0BxsQw/SzxFKI13NfDDpLmASorFf9J2jKlZVo7iVCO/SY7gEKhONk
 4zXVWzSO4e0uZRvB7pO3EplYScBGc0Y=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-495-WgZBv2xEMyKwbWzCgIN4ng-1; Wed, 04 Nov 2020 06:08:29 -0500
X-MC-Unique: WgZBv2xEMyKwbWzCgIN4ng-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id DEFD2100F78B;
 Wed,  4 Nov 2020 11:08:27 +0000 (UTC)
Received: from thuth.remote.csb (ovpn-112-151.ams2.redhat.com [10.36.112.151])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 558D51007508;
 Wed,  4 Nov 2020 11:08:25 +0000 (UTC)
Subject: Re: [PATCH 1/4] bsd-user: space required after semicolon
To: shiliyang <shiliyang@huawei.com>, richard.henderson@linaro.org,
 pbonzini@redhat.com, philmd@redhat.com, alex.bennee@linaro.org,
 laurent@vivier.eu
References: <fc9d7415-a17f-2958-69fd-0b5f54e553a1@huawei.com>
 <b7231b6c-97ad-5b4c-0932-08fa331dbb30@huawei.com>
From: Thomas Huth <thuth@redhat.com>
Message-ID: <28961057-f570-a203-e098-6ec0d5be3f75@redhat.com>
Date: Wed, 4 Nov 2020 12:08:24 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.6.0
MIME-Version: 1.0
In-Reply-To: <b7231b6c-97ad-5b4c-0932-08fa331dbb30@huawei.com>
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=thuth@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/11/03 00:03:41
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H4=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
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
Cc: alex.chen@huawei.com, hunongda@huawei.com, qemu-trivial@nongnu.org,
 qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 04/11/2020 11.20, shiliyang wrote:
> This patch fixes error style problems found by checkpatch.pl:
> ERROR: space required after that ';'
> 
> Signed-off-by: Liyang Shi <shiliyang@huawei.com>
> 
> ---
>  bsd-user/elfload.c | 2 +-
>  bsd-user/syscall.c | 4 ++--
>  2 files changed, 3 insertions(+), 3 deletions(-)
> 
> diff --git a/bsd-user/elfload.c b/bsd-user/elfload.c
> index 9f4210af9a..25e625d86b 100644
> --- a/bsd-user/elfload.c
> +++ b/bsd-user/elfload.c
> @@ -1227,7 +1227,7 @@ int load_elf_binary(struct linux_binprm *bprm, struct target_pt_regs *regs,
>      end_data = 0;
>      interp_ex.a_info = 0;
> 
> -    for(i=0;i < elf_ex.e_phnum; i++) {
> +    for(i=0; i < elf_ex.e_phnum; i++) {

While you're at it, please also add white spaces around the "=" in that line.

 Thanks,
  Thomas


