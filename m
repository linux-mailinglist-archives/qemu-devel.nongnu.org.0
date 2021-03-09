Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BE23A332853
	for <lists+qemu-devel@lfdr.de>; Tue,  9 Mar 2021 15:17:11 +0100 (CET)
Received: from localhost ([::1]:41346 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lJdAc-0000BA-Qx
	for lists+qemu-devel@lfdr.de; Tue, 09 Mar 2021 09:17:10 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:36770)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1lJd8I-0007aA-Ix
 for qemu-devel@nongnu.org; Tue, 09 Mar 2021 09:14:46 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:29510)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1lJd8G-0000Lu-90
 for qemu-devel@nongnu.org; Tue, 09 Mar 2021 09:14:46 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1615299283;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Gs18u8o4BXvoUgHk+99Yoq4u9fMRIi7JQCenios2SSw=;
 b=RMLsUDtzRsyLEsuZWiMqiL11A7d6HRSjHNvwcEKt2Py9NZLueTcYrCFE8XRR1Rm3mfslU+
 uzzBnnaXjjcmW5mNt4R3OuDn9uP5IcLN4JPEFtYxk018b09RT8mt/l2yEQvOLmcanz0x7k
 bzMSE7vP6Lnhsx/Tr7TzNAQRngP1Ynk=
Received: from mail-ej1-f69.google.com (mail-ej1-f69.google.com
 [209.85.218.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-574-WpbSSbijNq2-d4-3qgE3OA-1; Tue, 09 Mar 2021 09:14:41 -0500
X-MC-Unique: WpbSSbijNq2-d4-3qgE3OA-1
Received: by mail-ej1-f69.google.com with SMTP id v19so5704591ejc.12
 for <qemu-devel@nongnu.org>; Tue, 09 Mar 2021 06:14:41 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=Gs18u8o4BXvoUgHk+99Yoq4u9fMRIi7JQCenios2SSw=;
 b=YrV6K60hejLA/pHJsQ6NmWM9ARZmfDFAtBC0JfVodpZoAnZ4ZpieH1XwFefp7x2nFi
 FIHbCeDx2qX05OtyNJrB7s0iAfYrQj6JmYOhu0+DN11FejhGEutQ5/+4cMPIbc5sK6A+
 DYq4D750qOSzTH3qPUG8/Bq23ZW6MwqV7CElWCOFLmeG9npoq3HbYhAx7pT1Gg5jctmh
 zYcrQdKe7ZqVs5yYpo89fNgQ9QGjLtspvc5bscROE+W4MI3m7ScWgdLDQ1+4r7HP+xu3
 rbIU1lrBHN+8an+uBzTxwMg5/JEPDRlCJsD7RoMnuIGXLNuT6zQkqu+4yFPJoDpIcKZp
 nVhw==
X-Gm-Message-State: AOAM530Y9zQv2aNPJzc4Trl+MWFfrDSwZZgE7Fop2ED+tFxqb+Zvclqh
 sEGPIZIoesv4CpTgiFEVwxPYrtFUEQhbFv/kVpF83+Ohb0u1CffxV9XFqpkMCOCXE1kaWT7TIVM
 cVWsEwABbDwKYNoQ=
X-Received: by 2002:a17:906:c210:: with SMTP id
 d16mr20402693ejz.187.1615299280417; 
 Tue, 09 Mar 2021 06:14:40 -0800 (PST)
X-Google-Smtp-Source: ABdhPJyljQlcimQbwgG7nwfTMAKRlcWYR2OUOoYOPpeaLTbliEwe9LVaRTQN1qVyZcnQwV4M3kCFFw==
X-Received: by 2002:a17:906:c210:: with SMTP id
 d16mr20402680ejz.187.1615299280281; 
 Tue, 09 Mar 2021 06:14:40 -0800 (PST)
Received: from [192.168.1.36] (68.red-83-57-175.dynamicip.rima-tde.net.
 [83.57.175.68])
 by smtp.gmail.com with ESMTPSA id bj7sm5287472ejb.28.2021.03.09.06.14.39
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 09 Mar 2021 06:14:39 -0800 (PST)
Subject: Re: [PATCH] scsi: fix sense code for EREMOTEIO
To: Paolo Bonzini <pbonzini@redhat.com>, qemu-devel@nongnu.org
References: <20210309135752.187916-1-pbonzini@redhat.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Message-ID: <369adbbf-5ec4-2e1a-2df1-f9277123ac3f@redhat.com>
Date: Tue, 9 Mar 2021 15:14:38 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.0
MIME-Version: 1.0
In-Reply-To: <20210309135752.187916-1-pbonzini@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=63.128.21.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.251,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001,
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
Cc: =?UTF-8?Q?Marc-Andr=c3=a9_Lureau?= <marcandre.lureau@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 3/9/21 2:57 PM, Paolo Bonzini wrote:
> SENSE_CODE(LUN_COMM_FAILURE) has an ABORTED COMMAND sense key,
> so it results in a retry in Linux.  To ensure that EREMOTEIO
> is forwarded to the guest, use a HARDWARE ERROR sense key
> instead.  Note that the code before commit d7a84021d was incorrect
> because it used HARDWARE_ERROR as a SCSI status, not as a sense
> key.

It is not clear whether if it deserves a 'Fixes: d7a84021db8 ("scsi:
introduce scsi_sense_from_errno()")' or not...

> Reported-by: Marc-André Lureau <marcandre.lureau@redhat.com>
> Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>

Reviewed-by: Philippe Mathieu-Daudé <philmd@redhat.com>

> ---
>  scsi/utils.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/scsi/utils.c b/scsi/utils.c
> index 873e05aeaf..357b036671 100644
> --- a/scsi/utils.c
> +++ b/scsi/utils.c
> @@ -589,7 +589,7 @@ int scsi_sense_from_errno(int errno_value, SCSISense *sense)
>          return TASK_SET_FULL;
>  #ifdef CONFIG_LINUX
>          /* These errno mapping are specific to Linux.  For more information:
> -         * - scsi_decide_disposition in drivers/scsi/scsi_error.c
> +         * - scsi_check_sense and scsi_decide_disposition in drivers/scsi/scsi_error.c
>           * - scsi_result_to_blk_status in drivers/scsi/scsi_lib.c
>           * - blk_errors[] in block/blk-core.c
>           */
> @@ -599,7 +599,7 @@ int scsi_sense_from_errno(int errno_value, SCSISense *sense)
>          *sense = SENSE_CODE(READ_ERROR);
>          return CHECK_CONDITION;
>      case EREMOTEIO:
> -        *sense = SENSE_CODE(LUN_COMM_FAILURE);
> +        *sense = SENSE_CODE(TARGET_FAILURE);
>          return CHECK_CONDITION;
>  #endif
>      case ENOMEDIUM:
> 


