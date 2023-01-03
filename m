Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3852E65BFA1
	for <lists+qemu-devel@lfdr.de>; Tue,  3 Jan 2023 13:08:31 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pCg4p-0007op-KG; Tue, 03 Jan 2023 07:07:31 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1pCg4N-0007co-VF
 for qemu-devel@nongnu.org; Tue, 03 Jan 2023 07:07:04 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1pCg4M-0007Gn-8s
 for qemu-devel@nongnu.org; Tue, 03 Jan 2023 07:07:03 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1672747621;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=ZoLggbU0ATrTQLse/ozEs2EXi3BnM0xbMLcIWlxdF74=;
 b=ar4LIZzas7KxfNZULyPJkc5iP5lM/fS7gn0IXqKfTvTtNldP8hgzLBuLrGa9peN5S6XABg
 i5D7E8yPOiDDMY9iT8mpQbcqG99nmE8vSlCMd7Z32fQsFHTPBCWQJGFNMLhB+BRKS8Fapr
 BIv+mX7eM9MuJ21d7NEEGPEWMpW1pYw=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-671-pfjl8htpMw6v477Zt-740g-1; Tue, 03 Jan 2023 07:07:00 -0500
X-MC-Unique: pfjl8htpMw6v477Zt-740g-1
Received: by mail-wm1-f71.google.com with SMTP id
 fm17-20020a05600c0c1100b003d96f0a7f2eso16962902wmb.6
 for <qemu-devel@nongnu.org>; Tue, 03 Jan 2023 04:07:00 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=ZoLggbU0ATrTQLse/ozEs2EXi3BnM0xbMLcIWlxdF74=;
 b=qV/dwcbebrmczJIVXm3/f7KpibTXEF4Qucm5C3oTXLkD1n5uD7DUg5jE+lAuhK1yKq
 q6OxV0l9IHyXpExW5DUhVedxe3wc0Ugoq7727r3w3LEjnG78wfuiys1wWd4mlFgB39V/
 0pBhNGdVNbac6rD1hPtSB+OnD5z2B4074LQAzmVlcI3C29kEgJ0OG3wz++FEoYHRvYRX
 PFjCyo9GcyXTqmTAOK46HPNePipKHFkaYwUmqlgw1T5gBIAOFw4A7j9S20p9IzZsFxuJ
 wTi6gUlLTKB3TgU72wBRQM6bH13DdKUw6AN2Iuw2C5VYq2he2GvLX6Qzu1BXKG2LKuzR
 Sa8A==
X-Gm-Message-State: AFqh2krvYC9dqcgQv3H6E/YexECXA74cj/qmExNpgIUXNyhkGzUWraHq
 KBt2HsBLPcIixmwEC1r4OTJB+e8llI3K3rQTVmUQUsUoQV8LX6j1evjn0oMuDTg58feGMPXohWg
 96z6rJdQ33KRQ7fg=
X-Received: by 2002:adf:f28b:0:b0:274:357:6a12 with SMTP id
 k11-20020adff28b000000b0027403576a12mr25288544wro.55.1672747619453; 
 Tue, 03 Jan 2023 04:06:59 -0800 (PST)
X-Google-Smtp-Source: AMrXdXvjliNAsaWOvdhSbItfW2k0uY8OEJoXOJVAMZQH/91tPs3JC1pt0zmscplxdtbAdPYyH8h4hg==
X-Received: by 2002:adf:f28b:0:b0:274:357:6a12 with SMTP id
 k11-20020adff28b000000b0027403576a12mr25288521wro.55.1672747619237; 
 Tue, 03 Jan 2023 04:06:59 -0800 (PST)
Received: from [192.168.0.5] (ip-109-43-177-55.web.vodafone.de.
 [109.43.177.55]) by smtp.gmail.com with ESMTPSA id
 r14-20020a5d4e4e000000b002549b649b62sm30696334wrt.50.2023.01.03.04.06.56
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 03 Jan 2023 04:06:57 -0800 (PST)
Message-ID: <934ddb0a-0af5-a6ba-8df5-8d440f71968c@redhat.com>
Date: Tue, 3 Jan 2023 13:06:56 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.13.0
Subject: Re: [PATCH 02/10] tests: fix path separator, use g_build_filename()
Content-Language: en-US
To: marcandre.lureau@redhat.com, qemu-devel@nongnu.org
Cc: Laurent Vivier <lvivier@redhat.com>, Eric Blake <eblake@redhat.com>,
 Beraldo Leal <bleal@redhat.com>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Gerd Hoffmann <kraxel@redhat.com>, Stefan Weil <sw@weilnetz.de>,
 =?UTF-8?Q?Daniel_P=2e_Berrang=c3=a9?= <berrange@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Markus Armbruster <armbru@redhat.com>,
 =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>
References: <20230103110814.3726795-1-marcandre.lureau@redhat.com>
 <20230103110814.3726795-3-marcandre.lureau@redhat.com>
From: Thomas Huth <thuth@redhat.com>
In-Reply-To: <20230103110814.3726795-3-marcandre.lureau@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -58
X-Spam_score: -5.9
X-Spam_bar: -----
X-Spam_report: (-5.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-3.103, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On 03/01/2023 12.08, marcandre.lureau@redhat.com wrote:
> From: Marc-André Lureau <marcandre.lureau@redhat.com>
> 
> Signed-off-by: Marc-André Lureau <marcandre.lureau@redhat.com>
> ---
>   tests/unit/test-io-channel-command.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/tests/unit/test-io-channel-command.c b/tests/unit/test-io-channel-command.c
> index 19f72eab96..096224962c 100644
> --- a/tests/unit/test-io-channel-command.c
> +++ b/tests/unit/test-io-channel-command.c
> @@ -32,7 +32,7 @@ static char *socat = NULL;
>   static void test_io_channel_command_fifo(bool async)
>   {
>       g_autofree gchar *tmpdir = g_dir_make_tmp("qemu-test-io-channel.XXXXXX", NULL);
> -    g_autofree gchar *fifo = g_strdup_printf("%s/%s", tmpdir, TEST_FIFO);
> +    g_autofree gchar *fifo = g_build_filename(tmpdir, TEST_FIFO, NULL);
>       g_autofree gchar *srcargs = g_strdup_printf("%s - PIPE:%s,wronly", socat, fifo);
>       g_autofree gchar *dstargs = g_strdup_printf("%s PIPE:%s,rdonly -", socat, fifo);
>       g_auto(GStrv) srcargv = g_strsplit(srcargs, " ", -1);

Reviewed-by: Thomas Huth <thuth@redhat.com>


