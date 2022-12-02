Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C079E640567
	for <lists+qemu-devel@lfdr.de>; Fri,  2 Dec 2022 11:59:32 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p13jx-00017j-US; Fri, 02 Dec 2022 05:57:57 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1p13jv-00014M-Rr
 for qemu-devel@nongnu.org; Fri, 02 Dec 2022 05:57:55 -0500
Received: from mail-wr1-x42c.google.com ([2a00:1450:4864:20::42c])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1p13ju-0000AW-6y
 for qemu-devel@nongnu.org; Fri, 02 Dec 2022 05:57:55 -0500
Received: by mail-wr1-x42c.google.com with SMTP id y16so7256163wrm.2
 for <qemu-devel@nongnu.org>; Fri, 02 Dec 2022 02:57:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=3JKBW7EfBPc4cIEKzLIPuKr/vk6V/ENRlDXjqxeHKmc=;
 b=IZb7ihMrsyA41DS9o7fP84Atv6lU8BLfGfjdsNs1RqV4uTz3bxVDKFZKEANxtqz2VQ
 4ZEMMOSxAYLJF4E2Z8nCOkIYV4Rc3SWFyTvm16snIls+IYBNT0upKxItiGureQOI9kUr
 w7oWI/+4mqN7vZxrPybuxxqeI5Zl1oOiYa96d4U6qQVyHeqtpCAviWfkDImWqi8UKUJP
 cwtOsa3BRjlREnv6IX0gtbS5pQMvrgze7hSGNpZB0qBf/9ljtj2R0dHDm9ImTEFWG13P
 ixmzsv+OfH2nhsey1zb2dcwidXX63nET9cP+Lfva1PXvJy+1Vr4+owp/iRPRaod+cWKl
 /uJA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=3JKBW7EfBPc4cIEKzLIPuKr/vk6V/ENRlDXjqxeHKmc=;
 b=O3XkqWdMKQdYiSQyrzzTKlHyIG1DiWxegqCYi3GSfO3mmBAER1qAvey1MmBcxqXXl7
 M7Jq86VEkUBtHx+JQ4G8RJk8+RQu8yILI2QOoB5JNDeDtqvEGRLHThdn6xGDL9Gbe+X8
 XoMmArdIUmLu2wM+SzZIZf12J+jsVXPmwMbIojqIE6bS/OrIOqflsGemDt6Z2Ju64ai6
 kS/FxOx+EvQJx1Dk1lPVivOHnOou8WTYiB5OG7qM4GPFq+jTOF+lQHwZazXRJi6+N6Uy
 /LlNmVMrO8cf4XS7F/5Ig2RJXpbB9JHCCZJKlz5YmUSP/5FsKK5FbdJkLn8NGPQeckVh
 qlCQ==
X-Gm-Message-State: ANoB5pn3LSpVrld7wG66YY5w1LEAPtXoGgx6dU4iNOqocasfrVN8NBp0
 DaqVsmxmS6xiBxPh9ukH+SB+Ng==
X-Google-Smtp-Source: AA0mqf7cJvcV7tK957BzEOJwCeTJueNqPDCWFgPW8IRw6MbCp2cV25GVdl6+YViG1r5ZziNDkVMYJw==
X-Received: by 2002:adf:fec4:0:b0:242:149c:ef19 with SMTP id
 q4-20020adffec4000000b00242149cef19mr15620052wrs.364.1669978672293; 
 Fri, 02 Dec 2022 02:57:52 -0800 (PST)
Received: from [192.168.30.216] ([81.0.6.76]) by smtp.gmail.com with ESMTPSA id
 m6-20020a7bcb86000000b003cf7292c553sm247287wmi.13.2022.12.02.02.57.51
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 02 Dec 2022 02:57:51 -0800 (PST)
Message-ID: <78832eb6-215d-6818-7e41-a78d0648ac16@linaro.org>
Date: Fri, 2 Dec 2022 11:57:50 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.5.0
Subject: Re: [PATCH v2 10/14] ui: Factor out qmp_add_client() parts and move
 to ui/ui-qmp-cmds.c
Content-Language: en-US
To: Markus Armbruster <armbru@redhat.com>, qemu-devel@nongnu.org
Cc: kraxel@redhat.com, dgilbert@redhat.com, berrange@redhat.com
References: <20221202100512.4161901-1-armbru@redhat.com>
 <20221202100512.4161901-11-armbru@redhat.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <20221202100512.4161901-11-armbru@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42c;
 envelope-from=philmd@linaro.org; helo=mail-wr1-x42c.google.com
X-Spam_score_int: -23
X-Spam_score: -2.4
X-Spam_bar: --
X-Spam_report: (-2.4 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.257,
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

On 2/12/22 11:05, Markus Armbruster wrote:
> Signed-off-by: Markus Armbruster <armbru@redhat.com>
> ---
>   include/monitor/qmp-helpers.h | 26 ++++++++++++
>   monitor/qmp-cmds.c            | 74 ++++++++++++++++-------------------
>   ui/ui-qmp-cmds.c              | 41 +++++++++++++++++++
>   3 files changed, 100 insertions(+), 41 deletions(-)
>   create mode 100644 include/monitor/qmp-helpers.h


> @@ -174,54 +172,48 @@ void qmp_add_client(const char *protocol, const char *fdname,
>                       bool has_skipauth, bool skipauth, bool has_tls, bool tls,
>                       Error **errp)
>   {
> +    static struct {

const.

> +        const char *name;
> +        bool (*add_client)(int fd, bool has_skipauth, bool skipauth,
> +                           bool has_tls, bool tls, Error **errp);
> +    } protocol_table[] = {
> +        { "spice", qmp_add_client_spice },
> +#ifdef CONFIG_VNC
> +        { "vnc", qmp_add_client_vnc },
> +#endif
> +#ifdef CONFIG_DBUS_DISPLAY
> +        { "@dbus-display", qmp_add_client_dbus_display },
> +#endif
> +    };

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>


