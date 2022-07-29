Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 43C885853DD
	for <lists+qemu-devel@lfdr.de>; Fri, 29 Jul 2022 18:46:43 +0200 (CEST)
Received: from localhost ([::1]:43042 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oHT8L-0007Zu-Rr
	for lists+qemu-devel@lfdr.de; Fri, 29 Jul 2022 12:46:41 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35934)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1oHT6I-0005rL-Fo
 for qemu-devel@nongnu.org; Fri, 29 Jul 2022 12:44:37 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:54072)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1oHT6F-0004QH-BT
 for qemu-devel@nongnu.org; Fri, 29 Jul 2022 12:44:32 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1659113069;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=amVmnlNVRuxxUkcox2Ez5PZ2BP34S5++Tf5XtOfIfPY=;
 b=PKv5VhZAST336NNSM/3nI+/YcKgv37zBu1k+m26ymyYMZaK6f2FjM+xdogzhD4LT3+OnZm
 u9aH9HQ0v4ASch/HlWw8Vz4Gp+99Tca+ADOmZkU+tJpOxRm4xfo6F4uhjkX/jzxzGxZBEH
 wUA9VFHrjMZMzRkKJp9pcK3l855iLqo=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-426-UOKokSACNi2FEAkhVkuG-g-1; Fri, 29 Jul 2022 12:44:27 -0400
X-MC-Unique: UOKokSACNi2FEAkhVkuG-g-1
Received: by mail-wr1-f69.google.com with SMTP id
 j4-20020adfa544000000b0021ebac13bf3so1354027wrb.19
 for <qemu-devel@nongnu.org>; Fri, 29 Jul 2022 09:44:27 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=amVmnlNVRuxxUkcox2Ez5PZ2BP34S5++Tf5XtOfIfPY=;
 b=7jLUME0bkDiJ55JvRMhGkz0QmgXNh+dIJMTkpQHIsmvQGvIPb/aPVmqbzxl1I/muQc
 SDCQ/NMsn7xZ5ubQrT6iWj8v6FuSXIquXoB+Rin/ArL5p7jgCqi/ueWqNfvrQkQq06f4
 yBvI7NEmVgHWsj1mc086fsstwHHFpFwZepLiuSB3xUynrzxNSn8mSyhBiHTTyV+bJ4Ne
 HxrWbUPY1Jq/YbJXSW/zCkucD4lXis6+voSDNijVN7vXjRUUSbP2nBeh9s359CRiaLI9
 UF3VIeztZLMdC+BeQkLvW29xWPdtU2mgct8JW5Plpd+EVg37yNyaJI9RsjxeoIKwxh7k
 GS9w==
X-Gm-Message-State: AJIora9+MEmx65ECaDjpRy+aAV6GeWrWftNjCkVzDQ47oSOL6ibp/nV2
 jOFRvdg/GB4HGf+9jTAItDBEe1e6QS3LVa9R5WFRveT1i5forwKS9PBxI1VeQaZhJ40CScyQK4/
 1XsjLzZwaQIPSX10=
X-Received: by 2002:a05:600c:348d:b0:3a3:1fe6:6b38 with SMTP id
 a13-20020a05600c348d00b003a31fe66b38mr3080253wmq.144.1659113066357; 
 Fri, 29 Jul 2022 09:44:26 -0700 (PDT)
X-Google-Smtp-Source: AGRyM1sMhrVIpNUo5RhpxSv6ovOh9ci1FxtiZRHFOs3sHAp8c+nbVdJw6qye8/XOJs6pIhUfesKYLw==
X-Received: by 2002:a05:600c:348d:b0:3a3:1fe6:6b38 with SMTP id
 a13-20020a05600c348d00b003a31fe66b38mr3080245wmq.144.1659113066033; 
 Fri, 29 Jul 2022 09:44:26 -0700 (PDT)
Received: from [192.168.8.104] (tmo-096-80.customers.d1-online.com.
 [80.187.96.80]) by smtp.gmail.com with ESMTPSA id
 z5-20020a5d6405000000b0021f138e07acsm1620096wru.35.2022.07.29.09.44.21
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 29 Jul 2022 09:44:24 -0700 (PDT)
Message-ID: <3a832a37-6506-132b-c3ed-555b70a71d2f@redhat.com>
Date: Fri, 29 Jul 2022 18:44:18 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH RESEND] tests/tcg/linux-test: Fix random hangs in
 test_socket
Content-Language: en-US
To: Ilya Leoshkevich <iii@linux.ibm.com>, =?UTF-8?Q?Alex_Benn=c3=a9e?=
 <alex.bennee@linaro.org>
Cc: qemu-devel@nongnu.org, Christian Borntraeger <borntraeger@linux.ibm.com>
References: <20220725144251.192720-1-iii@linux.ibm.com>
From: Thomas Huth <thuth@redhat.com>
In-Reply-To: <20220725144251.192720-1-iii@linux.ibm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -6
X-Spam_score: -0.7
X-Spam_bar: /
X-Spam_report: (-0.7 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_SORBS_WEB=1.5,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 25/07/2022 16.42, Ilya Leoshkevich wrote:
> test_socket hangs randomly in connect(), especially when run without
> qemu. Apparently the reason is that linux started treating backlog
> value of 0 literally instead of rounding it up since v4.4 (commit
> ef547f2ac16b).
> 
> So set it to 1 instead.
> 
> Signed-off-by: Ilya Leoshkevich <iii@linux.ibm.com>
> ---
> 
> This is a rebase of the previous submission:
> https://lists.gnu.org/archive/html/qemu-devel/2021-06/msg00095.html
> 
>   tests/tcg/multiarch/linux/linux-test.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/tests/tcg/multiarch/linux/linux-test.c b/tests/tcg/multiarch/linux/linux-test.c
> index 019d8175ca..5a2a4f2258 100644
> --- a/tests/tcg/multiarch/linux/linux-test.c
> +++ b/tests/tcg/multiarch/linux/linux-test.c
> @@ -263,7 +263,7 @@ static int server_socket(void)
>       sockaddr.sin_port = htons(0); /* choose random ephemeral port) */
>       sockaddr.sin_addr.s_addr = 0;
>       chk_error(bind(fd, (struct sockaddr *)&sockaddr, sizeof(sockaddr)));
> -    chk_error(listen(fd, 0));
> +    chk_error(listen(fd, 1));
>       return fd;
>   
>   }

Not really my turf, but if there are no other takers and no complatins, I 
can take it through my testing branch:

https://gitlab.com/thuth/qemu/-/commits/testing-next

  Thomas


