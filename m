Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5A837673E18
	for <lists+qemu-devel@lfdr.de>; Thu, 19 Jan 2023 16:59:51 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pIXJU-0000bi-DH; Thu, 19 Jan 2023 10:58:52 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pIXJR-0000b0-Mj
 for qemu-devel@nongnu.org; Thu, 19 Jan 2023 10:58:50 -0500
Received: from mail-wm1-x335.google.com ([2a00:1450:4864:20::335])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pIXJP-00007T-Jc
 for qemu-devel@nongnu.org; Thu, 19 Jan 2023 10:58:49 -0500
Received: by mail-wm1-x335.google.com with SMTP id l8so1896711wms.3
 for <qemu-devel@nongnu.org>; Thu, 19 Jan 2023 07:58:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=9SQ0gKFhoh0Bayl5xDYaBRSPn/XqltG1Rgc2CgzJoX4=;
 b=fv/M/snN3i9dfRvEuDBcUgDo51B3Aw/KdlIGYnV2b3mXyGvLZovPeLlqGfeUxV1fs1
 u+NShF3JsO5uKnJidUNsdW8Ovw3sAfB6orUj1xk3C2UTxf6d/n9hg9tx3K2OFEe67yGu
 9igVamrPBOYnczdQUD+nlDVpxs8Wr1Jt6UHVKHcc1hTYCBrTa1t52wALd7nDVhRkVLrp
 s8z2XBmCcT22iPPR9LK48KIrE8/L4iczNMXWo8vlJOQl5RQr0GW4v5I1R6fSk5S9zFjB
 n3jrdRZWDKovtyTl7glCI2CKMi9Y0W8Z+AetG7bW6cV6Bh75GMpuQkCe7ikN8bXd7LcT
 NqJw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=9SQ0gKFhoh0Bayl5xDYaBRSPn/XqltG1Rgc2CgzJoX4=;
 b=xrmBgvg99QwirGH36GDUEaZqGQ9JAWAlRl2LvGcco779tIZtiCk456Os2jR2Ebenjs
 /WwIYoFuKumRPye1Z21CMghDd8W4uIe45jhdIniQE85O1Co3TvI7g46uWEdD1MuUpdkw
 1TGZ6y+w0gDgHpjS4vWFRYtVFyL1hLoYfx3KhM/Fx1TbMqwV7E4WrkHceZ0+oJf1Y7cI
 QmolPMq1vGJKrT/q/hUDpTdRGKAvK2FFyIuZubfNhyftA1woC1J41J04OLVC1n83JpeQ
 mWGoeRIkCPp8J2IRxZ8r8Jj1wmgAXe57p+scjmUu+QNcPcHvKXILnfo5IwRJOalCWRPY
 UtMQ==
X-Gm-Message-State: AFqh2krXFAsrtq2PKifwXC1+K7SsnJfERlYaN8cFUZtjkWr9WBDkvQD6
 kJoVASWNry022gjZqVrungslhO8Np8bkBniH
X-Google-Smtp-Source: AMrXdXs7g2DL04CZ22fAZAFOZJZk7yPcdzIqG8+jYOYvzDKeDpG//A1BPDHmHP4aCpvitgx/RJt7ug==
X-Received: by 2002:a05:600c:348f:b0:3db:742:cfe9 with SMTP id
 a15-20020a05600c348f00b003db0742cfe9mr10413965wmq.34.1674143925932; 
 Thu, 19 Jan 2023 07:58:45 -0800 (PST)
Received: from [192.168.30.216] ([81.0.6.76]) by smtp.gmail.com with ESMTPSA id
 t2-20020a1c7702000000b003d995a704fdsm5077872wmi.33.2023.01.19.07.58.44
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 19 Jan 2023 07:58:45 -0800 (PST)
Message-ID: <5d40fb61-c71a-cce4-0731-5cc5f48c594c@linaro.org>
Date: Thu, 19 Jan 2023 16:58:44 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.6.1
Subject: Re: [PATCH 00/20] target/arm: CONFIG_TCG=n part 1
Content-Language: en-US
To: Fabiano Rosas <farosas@suse.de>, qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, Peter Maydell <peter.maydell@linaro.org>,
 Richard Henderson <richard.henderson@linaro.org>,
 =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 Paolo Bonzini <pbonzini@redhat.com>, Claudio Fontana <cfontana@suse.de>,
 Eduardo Habkost <ehabkost@redhat.com>, Alexander Graf <agraf@csgraf.de>
References: <20230118193518.26433-1-farosas@suse.de>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <20230118193518.26433-1-farosas@suse.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2a00:1450:4864:20::335;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x335.google.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.094,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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

On 18/1/23 20:34, Fabiano Rosas wrote:
> These are the already reviewed patches from the first half of my
> previous series:
> https://lore.kernel.org/r/20230113140419.4013-1-farosas@suse.de
> 
> This unbreaks the --disable-tcg build, but there are issues in runtime
> that are still being hashed out in the other series.
> 
> For the build _with_ TCG, this should behave the same as master.

If you respin, please include this build-only CI test to avoid your
work to bitrot until the rest is merged:

https://lore.kernel.org/qemu-devel/20230119155646.50503-1-philmd@linaro.org/

Peter, if this is good enough for you please consider the CI patch
on top of this series.

Regards,

Phil.

