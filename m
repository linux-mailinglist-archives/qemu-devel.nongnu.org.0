Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9F661487927
	for <lists+qemu-devel@lfdr.de>; Fri,  7 Jan 2022 15:42:16 +0100 (CET)
Received: from localhost ([::1]:41318 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n5qRZ-0007u7-Nd
	for lists+qemu-devel@lfdr.de; Fri, 07 Jan 2022 09:42:13 -0500
Received: from eggs.gnu.org ([209.51.188.92]:35700)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1n5qMG-0005Uk-Uw
 for qemu-devel@nongnu.org; Fri, 07 Jan 2022 09:36:44 -0500
Received: from [2a00:1450:4864:20::42c] (port=39696
 helo=mail-wr1-x42c.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1n5qMF-0008Uh-DQ
 for qemu-devel@nongnu.org; Fri, 07 Jan 2022 09:36:44 -0500
Received: by mail-wr1-x42c.google.com with SMTP id s1so11449234wra.6
 for <qemu-devel@nongnu.org>; Fri, 07 Jan 2022 06:36:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=GSASAOqaOEhIMjby0Ml6ixWzKvI0bGUvRfq6/JCTR/w=;
 b=hu857Yx0DTSr4jRYc42kvFf0AR6za8FBc+vgR8aZ6eKc7pcYVAfndBPc3pvazBE7B4
 hzhaRaS1Tz/jlzTveHQxTFLE+zqxQJchPS+g3EG3N0EnagJg4HImgG1IoetMm/H4ijZN
 B08Xs2Rt6KPg83aFuMRS+ohWteqIeIy8ojroaje5Bg9x+as/uBVqLx3w8s9n8Ht2L7jA
 V9NegGY8bwP4hEdFQ1txC2hiIY5RzZUuxVbFHfUQKC3LOODcYQtI+r+JPBmPcE9IDX9R
 W5nZm3HuWV2HidD6WDu51V5DgLlqIWgENZZu2T5a73/yLMSRukwcHE6whyQBaabjx0hV
 NRQg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:message-id:date:mime-version:user-agent
 :subject:content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=GSASAOqaOEhIMjby0Ml6ixWzKvI0bGUvRfq6/JCTR/w=;
 b=tqBX97Q+3Gm75lChh/gLNagT8SEBhml5FmrL7vKiuKHoEjplV9JOsJOygu0InIbkb7
 E/vSgdd+5Sn8tTZi8FUoOmrUZcYmzSCHy9KvE5La2NLNXZxvupSzq2fLZ5RDtg8FBMfC
 DLcVL8Evom94j/6qeC3IkY5YT+367UxdU6s2RnG0+7/H6VPAPaFuJRgOUh16WJZG0I44
 YZgVxWBRsrCsRAkYqXNGflwyDF5sq7t7NWFuHNrEQKed3vjGbJFgp5RbAuZu0QvICu/3
 3iEGAQeMlwXyMInafL1UaU5BXzyAAMTjprPUUqp0LQRbAN0eBksYi9ZUxBPirZxlvvEu
 C2zA==
X-Gm-Message-State: AOAM532lNPM8feyCzodCnHGd6yNAHG5RY06X9/7TRU2sGq9+gtewtWHs
 ldcI7s2PzUxerp/EWqfX8uY=
X-Google-Smtp-Source: ABdhPJx8R6Yiotds7KJLUJajGjSeqwLvNZKEawkCk81ayk7/2fhEKh5bE8cUj1eB7eMJICb4ZhnZjw==
X-Received: by 2002:a5d:5348:: with SMTP id t8mr54548030wrv.439.1641566199364; 
 Fri, 07 Jan 2022 06:36:39 -0800 (PST)
Received: from [192.168.1.33] (83.red-83-50-87.dynamicip.rima-tde.net.
 [83.50.87.83])
 by smtp.gmail.com with ESMTPSA id l8sm4984995wrv.25.2022.01.07.06.36.38
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 07 Jan 2022 06:36:38 -0800 (PST)
Message-ID: <132c4a62-d56c-45ce-8c2e-03dfc6faacb7@amsat.org>
Date: Fri, 7 Jan 2022 14:30:11 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.4.1
Subject: Re: [PATCH 02/15] audio: move function audio_pcm_hw_clip_out()
Content-Language: en-US
To: =?UTF-8?Q?Volker_R=c3=bcmelin?= <volker.ruemelin@t-online.de>,
 Gerd Hoffmann <kraxel@redhat.com>
References: <cfcae86f-59c3-a2c5-76cd-1ab5e23e20f3@t-online.de>
 <20220106092332.7223-2-volker.ruemelin@t-online.de>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
In-Reply-To: <20220106092332.7223-2-volker.ruemelin@t-online.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::42c
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::42c;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x42c.google.com
X-Spam_score_int: -33
X-Spam_score: -3.4
X-Spam_bar: ---
X-Spam_report: (-3.4 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.25,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.25, NICE_REPLY_A=-2.691,
 RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793, SPF_HELO_NONE=0.001,
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
Cc: qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 6/1/22 10:23, Volker Rümelin wrote:
> From: Volker Rümelin <vr_qemu@t-online.de>
> 
> Move the function audio_pcm_hw_clip_out() into the correct
> section 'Hard voice (playback)'.
> 
> Signed-off-by: Volker Rümelin <vr_qemu@t-online.de>
> ---
>   audio/audio.c | 38 +++++++++++++++++++-------------------
>   1 file changed, 19 insertions(+), 19 deletions(-)

Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>

