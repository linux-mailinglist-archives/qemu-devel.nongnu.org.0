Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E780068DC18
	for <lists+qemu-devel@lfdr.de>; Tue,  7 Feb 2023 15:51:29 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pPPIU-0003MZ-0i; Tue, 07 Feb 2023 09:50:14 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pPPIR-0003M7-MW
 for qemu-devel@nongnu.org; Tue, 07 Feb 2023 09:50:11 -0500
Received: from mail-wm1-x329.google.com ([2a00:1450:4864:20::329])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pPPIM-0003lw-Oi
 for qemu-devel@nongnu.org; Tue, 07 Feb 2023 09:50:11 -0500
Received: by mail-wm1-x329.google.com with SMTP id o36so11216707wms.1
 for <qemu-devel@nongnu.org>; Tue, 07 Feb 2023 06:50:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=nxMkl45XiBM1aBlMNF3vUsPV8qHD+Ur7DhIsnN2VJKA=;
 b=BSHxGSQCY83St3dSiN658GFcfkSLg511p1rxPozfmOuxB/2PYOaCjmqumE9RLax45H
 PQqFVG6ZGFSmWPlOqh9Bbub4aimHcwrL8GK2YdqfA5Z4J6zjqe6Y5GclglppzrZsfays
 7f7njJUfVyb6Hv0gBYL9yyT5m8EOmbnyDa5qBjbBgC5WoOjGdLvdiouAtMG280WDWKhy
 79RJUz3Y4gxBzKOYUpl4e2iL4eAhP6kXx6OTanIA139/BO2vVz1a/Q256PiN2RGqGqbY
 h6X7XypWQ+1NnrLQadUte8jCvPxDeP66NBXlhPIE0miQabd3l2y7Bkkn/NAS8hni8e82
 vivQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=nxMkl45XiBM1aBlMNF3vUsPV8qHD+Ur7DhIsnN2VJKA=;
 b=gsHScnDnuVgLWavYJJ7tAZ8yHLdHKFlh4fTfwabc4d9/pQQBlRFOZJVrbmVNsqpxZf
 WmYHlMMxz8WaEQ2KWqUOvd/LM74ZRx/fZeysylwpjxNKCd+Smmgrb/anHbEzv22uP2DJ
 UfLWpTAWNgQKkUutY1m5K/iKKqQz6DnOuUjaoUnCuImZZJmDYiqHOxKPw3Qp8Vus2pj7
 68mHczb+hXh7/bbGQrE7C1U4A9axPyrDa9JOf9r2BGjly3cKHL2Y0vKpkdXVbddIpvDD
 RnVMcgznCG9TpHsDetHoNppWI8RA3aUWd5V5VkFBFg7lqrcngabSuPfYopP1PIKTwOAF
 x2bw==
X-Gm-Message-State: AO0yUKVfhyKavhw6JXozvG+BNl+SjuEmevp0HVsJaiX5FwtPpjLcD+ZI
 03Gbjai0NeHdU+V+QB2RRgZLTQ==
X-Google-Smtp-Source: AK7set9hafdXA4ULPBwd7mqQNMWDFbmdjhy7GOlu0+tgqcMWtrvJYmbn2FF+GT1YrYA9i4SFkCgHAw==
X-Received: by 2002:a05:600c:3197:b0:3dc:5240:53b6 with SMTP id
 s23-20020a05600c319700b003dc524053b6mr3465797wmp.6.1675781405013; 
 Tue, 07 Feb 2023 06:50:05 -0800 (PST)
Received: from [192.168.30.216] ([81.0.6.76]) by smtp.gmail.com with ESMTPSA id
 t8-20020a05600c198800b003dff870ce0esm8721125wmq.2.2023.02.07.06.50.03
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 07 Feb 2023 06:50:04 -0800 (PST)
Message-ID: <a8cd6b40-7b69-74bd-c706-f62557a2248a@linaro.org>
Date: Tue, 7 Feb 2023 15:50:02 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.6.1
Subject: Re: [PATCH v3 08/10] qmp: teach 'getfd' to import sockets on win32
Content-Language: en-US
To: marcandre.lureau@redhat.com, qemu-devel@nongnu.org
Cc: Beraldo Leal <bleal@redhat.com>, Eric Blake <eblake@redhat.com>,
 Stefan Weil <sw@weilnetz.de>, =?UTF-8?Q?Alex_Benn=c3=a9e?=
 <alex.bennee@linaro.org>, Paolo Bonzini <pbonzini@redhat.com>,
 Laurent Vivier <lvivier@redhat.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Gerd Hoffmann <kraxel@redhat.com>, Michael Roth <michael.roth@amd.com>,
 Markus Armbruster <armbru@redhat.com>,
 =?UTF-8?Q?Daniel_P=2e_Berrang=c3=a9?= <berrange@redhat.com>,
 Thomas Huth <thuth@redhat.com>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>
References: <20230207142535.1153722-1-marcandre.lureau@redhat.com>
 <20230207142535.1153722-9-marcandre.lureau@redhat.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <20230207142535.1153722-9-marcandre.lureau@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::329;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x329.google.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-1.148,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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

On 7/2/23 15:25, marcandre.lureau@redhat.com wrote:
> From: Marc-André Lureau <marcandre.lureau@redhat.com>
> 
> A process with enough capabilities can duplicate a socket to QEMU.
> Modify 'getfd' to import it and add it to the monitor fd list, so it can
> be later used by other commands.
> 
> Note that we actually store the SOCKET in the FD list, appropriate care
> must now be taken to use the correct socket functions (similar approach
> is taken by our io/ code and in glib, this is internal and shouldn't
> affect the QEMU/QMP users)
> 
> Signed-off-by: Marc-André Lureau <marcandre.lureau@redhat.com>
> ---
>   qapi/misc.json     | 16 ++++++++--
>   monitor/fds.c      | 79 ++++++++++++++++++++++++++++++++++++----------
>   monitor/hmp-cmds.c |  6 +++-
>   3 files changed, 81 insertions(+), 20 deletions(-)


> +void qmp_getfd(const char *fdname,
> +#ifdef WIN32
> +               const char *wsa_info,

Rename as 'optional_b64_context' and remove #ifdef'ry?

Preferrably change qmp_getfd() prototype and use close_fd()
in a preliminary patch. Otherwise LGTM.

> +#endif
> +               Error **errp)
> +{
> +    Monitor *cur_mon = monitor_cur();
> +    int fd;
> +
> +#ifdef WIN32
> +    if (wsa_info) {
> +        g_autofree WSAPROTOCOL_INFOW *info = NULL;
> +        gsize len;
> +        SOCKET sk;
> +
> +        info = (void *)g_base64_decode(wsa_info, &len);
> +        if (len != sizeof(*info)) {
> +            error_setg(errp, "Invalid WSAPROTOCOL_INFOW value");
> +            return;
> +        }
> +
> +        sk = WSASocketW(FROM_PROTOCOL_INFO, FROM_PROTOCOL_INFO,
> +                        FROM_PROTOCOL_INFO, info, 0, 0);
> +        if (sk == INVALID_SOCKET) {
> +            g_autofree gchar *emsg = g_win32_error_message(WSAGetLastError());
> +            error_setg(errp, "Couldn't create socket: %s", emsg);
> +            return;
> +        }
> +
> +        return monitor_add_fd(cur_mon, sk, fdname, errp);
> +    }
> +#endif
> +
> +    fd = qemu_chr_fe_get_msgfd(&cur_mon->chr);
> +    if (fd == -1) {
> +        error_setg(errp, "No file descriptor supplied via SCM_RIGHTS");
> +        return;
> +    }
> +
> +    return monitor_add_fd(cur_mon, fd, fdname, errp);
>   }


