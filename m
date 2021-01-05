Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E71CC2EABAE
	for <lists+qemu-devel@lfdr.de>; Tue,  5 Jan 2021 14:18:45 +0100 (CET)
Received: from localhost ([::1]:47322 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kwmEX-0004jv-0g
	for lists+qemu-devel@lfdr.de; Tue, 05 Jan 2021 08:18:45 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:35176)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <konrad@adacore.com>)
 id 1kwmBo-0003rl-Tn
 for qemu-devel@nongnu.org; Tue, 05 Jan 2021 08:15:58 -0500
Received: from mail-wm1-x32d.google.com ([2a00:1450:4864:20::32d]:55232)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <konrad@adacore.com>)
 id 1kwmBh-0006tW-CA
 for qemu-devel@nongnu.org; Tue, 05 Jan 2021 08:15:54 -0500
Received: by mail-wm1-x32d.google.com with SMTP id c133so2983074wme.4
 for <qemu-devel@nongnu.org>; Tue, 05 Jan 2021 05:15:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=adacore-com.20150623.gappssmtp.com; s=20150623;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=u4H8Vw7LY1Zf4kwd3cgF8JgX2IkHP+Hx5WZfxEZv0kY=;
 b=DH1i7tfH/b/vP28J1lxmHvKrj7vERrotVc2v78KyWS9aU7+1Tps8wfwzFeiZq9XRUu
 +cflOodXdm97KBCgFdEE+MLlXKI/ssMifYLJNY/oCmtx8pzef/wvLlegZttxNtWpYDyw
 LGQE2nHdkWqahOvJXblEdGkJgsVUH2D9V+llX8/ycDvhGFpasNzWqs5h6xWDlvRKNiNn
 J0l7dQIsJWSiUFSxJkJ4k+1lHEtZwCLigmJBkg93Cc5V88k7a7wy61YoePK2h89eH4Bs
 //LoPbo25Q27Tdj22nsiiEmp8cU/EJsbv3YNq5kIuNLWqYVMhNQ3UfmwwshvXN1Mok+N
 pKmQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=u4H8Vw7LY1Zf4kwd3cgF8JgX2IkHP+Hx5WZfxEZv0kY=;
 b=jlgnuDqyTxO4ESUP8EcYiltUOEkuywqfpxXLNCvOWEzCpcpzwjR5bGtzWXH5EqgDhS
 wgHmihpf/uv7AFEZLfFBo3XZNL/9/5hExhqr3cG1Gd968FtChFmd/UlvwtTMFyKLpNlo
 not0WJi5I5fVN3VKO94RqF0eUn9bLxgJZMp1Aj3TVK2o8B6ApGw0apxwnwj3TKKbdVC/
 8k8qLSy6ui0fhbqey9zhQkHYvaMb0IVKK5HpFL6N5/bKLKXPfqnOnlgC/SxJEoRrB/j/
 3IOXF81jJXeI9i2YlLJTTfbuqQVQHhZygzmGKX72l1niL2752ZdrYVfIFcR0Kbu7bvqh
 mIMQ==
X-Gm-Message-State: AOAM532Ivj+rsShLd4uvIUcGKOY/51lz1KLx9mJwJfLImQJzoTsOyUMq
 EgywtbbyICQ2YOFo5IBD6AX7jA==
X-Google-Smtp-Source: ABdhPJxB8fvOAtPu2O5EMoxitadX/piQneNgPWUxypZhBpbcOi7r+LNYi4SvMIVYcuVxTbKVBhJgIw==
X-Received: by 2002:a1c:b788:: with SMTP id h130mr3457933wmf.94.1609852547950; 
 Tue, 05 Jan 2021 05:15:47 -0800 (PST)
Received: from localhost.localdomain
 (alille-651-1-136-169.w90-1.abo.wanadoo.fr. [90.1.135.169])
 by smtp.gmail.com with ESMTPSA id x7sm3891673wmi.11.2021.01.05.05.15.47
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 05 Jan 2021 05:15:47 -0800 (PST)
Subject: Re: [PATCH 2/2] include/hw/sparc/grlib.h: Remove unused set_pil_in_fn
 typedef
To: Peter Maydell <peter.maydell@linaro.org>, qemu-devel@nongnu.org
References: <20201212144134.29594-1-peter.maydell@linaro.org>
 <20201212144134.29594-3-peter.maydell@linaro.org>
From: Fred Konrad <konrad@adacore.com>
Message-ID: <0828d066-21e9-ec57-d902-3a963c7b2cfe@adacore.com>
Date: Tue, 5 Jan 2021 14:15:47 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.0
MIME-Version: 1.0
In-Reply-To: <20201212144134.29594-3-peter.maydell@linaro.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: fr
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32d;
 envelope-from=konrad@adacore.com; helo=mail-wm1-x32d.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, NICE_REPLY_A=-0.249, RCVD_IN_DNSWL_NONE=-0.0001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
 Artyom Tarasenko <atar4qemu@gmail.com>, Fabien Chouteau <chouteau@adacore.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>



Le 12/12/20 à 3:41 PM, Peter Maydell a écrit :
> The grlib.h header defines a set_pil_in_fn typedef which is never
> used; remove it.
> 
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
> ---
>   include/hw/sparc/grlib.h | 2 --
>   1 file changed, 2 deletions(-)
> 
> diff --git a/include/hw/sparc/grlib.h b/include/hw/sparc/grlib.h
> index e1d1beaa73f..2104f493f32 100644
> --- a/include/hw/sparc/grlib.h
> +++ b/include/hw/sparc/grlib.h
> @@ -34,8 +34,6 @@
>   /* IRQMP */
>   #define TYPE_GRLIB_IRQMP "grlib,irqmp"
>   
> -typedef void (*set_pil_in_fn) (void *opaque, uint32_t pil_in);
> -
>   void grlib_irqmp_ack(DeviceState *dev, int intno);
>   
>   /* GPTimer */
> 

Reviewed-by: KONRAD Frederic <frederic.konrad@adacore.com>

