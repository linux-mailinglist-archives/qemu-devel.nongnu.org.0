Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 464F729A74B
	for <lists+qemu-devel@lfdr.de>; Tue, 27 Oct 2020 10:06:46 +0100 (CET)
Received: from localhost ([::1]:55226 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kXKwG-0004Jk-Rh
	for lists+qemu-devel@lfdr.de; Tue, 27 Oct 2020 05:06:44 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42440)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1kXKuc-0003ag-Jg
 for qemu-devel@nongnu.org; Tue, 27 Oct 2020 05:05:02 -0400
Received: from mail-ed1-x543.google.com ([2a00:1450:4864:20::543]:36716)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1kXKuZ-0006FL-Kv
 for qemu-devel@nongnu.org; Tue, 27 Oct 2020 05:05:02 -0400
Received: by mail-ed1-x543.google.com with SMTP id l16so623825eds.3
 for <qemu-devel@nongnu.org>; Tue, 27 Oct 2020 02:04:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:subject:to:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=RTw4yWzgS0GzkO31Uj/rnC6eBL8o9idMUnFhdM7ytAQ=;
 b=S2ZulYkTA6Teh7jeh/SPA3Omv5mceS/IX/RxRGwDTSiQRQ2071kF4KfEv8eEV6XcWV
 niXDotCsSX9b9EOPVNzWmD15GnVuro7dCthAhZrYBroiFr6AUTB0rOH6uqc14lS2vR7v
 Aka0bhBI1BzEqm3rNTBhIyiOtVANWnLnff0T9+625KDeaVfd+WG42w2Bgo8mDKPTAmPi
 ujwLEyb6uzP4Bsfl9VuIayPwbVnlJpYHY4z5S4xttcYikwKhWMsNXTfABH7kSNFGBsd0
 JglcVRrP71W6dRwIrmARW228GPReuHDMEDCF/oHbA8oAFUvgA+hKE19mS9MKOc/lu0MX
 j3oA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:subject:to:references:from:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=RTw4yWzgS0GzkO31Uj/rnC6eBL8o9idMUnFhdM7ytAQ=;
 b=GXCD7WANwQDK2PkI2dg5+q8YANH+/J4XaD2PaDpuyCxBk64C10N1FlSJxX/xdEChaB
 ncBtarAr4E0KR9lHRXdpKLhKgOEpF092FM4+LebOSJoHlrMDMDrEJbq8DVMG2v27G00f
 Xd9V6f398SibKt5siB+1bwiQ0af5H0iLTLgQU4GYG2Flt7SNS0U793Kq8lrGzmbq61et
 UMMZt9SswIOg9KDrsxMdA0JD9uaxqfGKn3ppJw+S7Ht5TMkCU+P+3Vt8n8Fuao47tne+
 Jaj/OJJ/mUI6K8ZwjwbvNamtTnSxkFeAmi3W2SPQmM20VM7Ro1tqBQMdqCM/+vgJfR1d
 JVIA==
X-Gm-Message-State: AOAM533kEQJcTXUXtO0FmMP8hVnf2ShRCQhT49iIVLWLp09YHT5Ok0mn
 85mu2D2TF/gp2RTL5LScDwc=
X-Google-Smtp-Source: ABdhPJyKVq122AC5AflQhO/6GW+18EUCCoJuUPEQqjZF6pTcUat2Fc3xkYisF/d1Qoh77HtGoAJxbw==
X-Received: by 2002:aa7:c608:: with SMTP id h8mr1119517edq.16.1603789497957;
 Tue, 27 Oct 2020 02:04:57 -0700 (PDT)
Received: from [192.168.1.36] (237.red-88-18-140.staticip.rima-tde.net.
 [88.18.140.237])
 by smtp.gmail.com with ESMTPSA id i4sm586028ejz.62.2020.10.27.02.04.56
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 27 Oct 2020 02:04:57 -0700 (PDT)
Subject: Re: [PATCH 2/9] dev-serial: use USB_SERIAL QOM macro for
 USBSerialState assignments
To: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>, qemu-devel@nongnu.org,
 kraxel@redhat.com, samuel.thibault@ens-lyon.org
References: <20201026083401.13231-1-mark.cave-ayland@ilande.co.uk>
 <20201026083401.13231-3-mark.cave-ayland@ilande.co.uk>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Message-ID: <fe9946be-f916-9141-a296-6f615d29adc0@amsat.org>
Date: Tue, 27 Oct 2020 10:04:56 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.3.1
MIME-Version: 1.0
In-Reply-To: <20201026083401.13231-3-mark.cave-ayland@ilande.co.uk>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::543;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-ed1-x543.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
X-Spam_score_int: -36
X-Spam_score: -3.7
X-Spam_bar: ---
X-Spam_report: (-3.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.25,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249, NICE_REPLY_A=-2.167,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 10/26/20 9:33 AM, Mark Cave-Ayland wrote:
> Signed-off-by: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
> ---
>  hw/usb/dev-serial.c | 6 +++---
>  1 file changed, 3 insertions(+), 3 deletions(-)

Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>

