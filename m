Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 92C67651FD9
	for <lists+qemu-devel@lfdr.de>; Tue, 20 Dec 2022 12:41:15 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p7aix-0007wu-0r; Tue, 20 Dec 2022 06:23:55 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1p7aiu-0007wR-Gk
 for qemu-devel@nongnu.org; Tue, 20 Dec 2022 06:23:52 -0500
Received: from mail-wr1-x432.google.com ([2a00:1450:4864:20::432])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1p7ais-00060g-Tx
 for qemu-devel@nongnu.org; Tue, 20 Dec 2022 06:23:52 -0500
Received: by mail-wr1-x432.google.com with SMTP id o5so11429250wrm.1
 for <qemu-devel@nongnu.org>; Tue, 20 Dec 2022 03:23:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=kk53WL6TidAYvbeR1YVu5wnhy4SKwqn3yK3Lmikeoqc=;
 b=Gzj+DT2UWgOzt+ft/FWbgEs28Cg8jv2VJR3GzLNsRX27+ACuj26mHXIe6bhaMxb+DW
 WKhUggROooUnb/wlf+B0+Qh/3B1q8kXAHw3nHjZuWsSfpBN57hqkdx3SL7qHX42mcgEk
 ljiFTLc7Tmg42t+cL6aGid/qVlt+aTbv6DoOtN6GOmuNp0UibiR+tVe/zHeUGbnfhEdG
 4uy8Zi7A9462uMotaY2V0gIRuf1GR2aod+B+nDaO52b/zpDj+bKScg5zzIwy7FN7feYl
 3vmRcjI0ylFdc0NdNwGoARP8VLkitNwvS4DoM9D/ZH7QKMcXsO9Lr74DXJK0NbFiLSB8
 hkcA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=kk53WL6TidAYvbeR1YVu5wnhy4SKwqn3yK3Lmikeoqc=;
 b=MJ/2n9E80tC5EB+m+U22GW0Do7jCO+2nZo2LBCmhqcyUnEXdNBFwo29pab7JNw07Id
 mO6HsmOuLzFP02v2SEHJsWY+f4W86tBTNmJbPkljvmWhSTIn+BcuKvWiMnACqJDDtcbb
 komo0LS2zUtS+E8Nl0HbwPwMyzx8vyuugB2+gdX/ZrJ1doLM/jHipEpPaSfkn/GEcG9u
 S4PjgZ8k0X6WnHBMAWOHyY0CB+yuAYeFzttGWwpVbW7mjpZcXcSwfdk602pOIN5B/AaY
 f7uPyhdkqPjOra0DBpF5MFUKWWrHmxjAVVdh94moQWylHtUCEjtcx2teTISHIaOKD8tL
 DnPA==
X-Gm-Message-State: ANoB5pkifDgdB/4KV+wnN9logmWHW42FHb5iwEaEk56ZTqD+PlGoWROo
 ysWRM98pRlm3nygMRlqVIe9AfQ==
X-Google-Smtp-Source: AA0mqf7IF+hY2rS59PnssMclrtULgDMdXH7LGbrIzsqUa4XG4inOz1BovmzzhMCvqh2yKrnTky7xqA==
X-Received: by 2002:a5d:5b1d:0:b0:24b:b74d:8012 with SMTP id
 bx29-20020a5d5b1d000000b0024bb74d8012mr19956054wrb.18.1671535429292; 
 Tue, 20 Dec 2022 03:23:49 -0800 (PST)
Received: from [192.168.30.216] ([81.0.6.76]) by smtp.gmail.com with ESMTPSA id
 p13-20020a056000018d00b002422202fa7fsm12352934wrx.39.2022.12.20.03.23.47
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 20 Dec 2022 03:23:48 -0800 (PST)
Message-ID: <413800aa-6779-8c12-1aa7-248ffde9bc67@linaro.org>
Date: Tue, 20 Dec 2022 12:23:47 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.6.0
Subject: Re: [PATCH v3 13/18] ui: Improve "change vnc" error reporting
Content-Language: en-US
To: Markus Armbruster <armbru@redhat.com>, qemu-devel@nongnu.org
Cc: kraxel@redhat.com, dgilbert@redhat.com, berrange@redhat.com
References: <20221220090645.2844881-1-armbru@redhat.com>
 <20221220090645.2844881-14-armbru@redhat.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <20221220090645.2844881-14-armbru@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::432;
 envelope-from=philmd@linaro.org; helo=mail-wr1-x432.google.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-1.149,
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

On 20/12/22 10:06, Markus Armbruster wrote:
> Switch from monitor_printf() to error_setg() and hmp_handle_error().
> This makes "this is an error" more obvious both in the source and in
> the monitor, where hmp_handle_error() prefixes the message with
> "Error: ".
> 
> Signed-off-by: Markus Armbruster <armbru@redhat.com>
> Reviewed-by: Daniel P. Berrangé <berrange@redhat.com>
> ---
>   monitor/hmp-cmds.c | 8 ++++----
>   1 file changed, 4 insertions(+), 4 deletions(-)

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>


