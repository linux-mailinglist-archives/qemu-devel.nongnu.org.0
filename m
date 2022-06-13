Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7ADCF548615
	for <lists+qemu-devel@lfdr.de>; Mon, 13 Jun 2022 17:55:30 +0200 (CEST)
Received: from localhost ([::1]:56686 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o0mPZ-0008At-JO
	for lists+qemu-devel@lfdr.de; Mon, 13 Jun 2022 11:55:29 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38456)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1o0mMe-0004Ho-7V
 for qemu-devel@nongnu.org; Mon, 13 Jun 2022 11:52:28 -0400
Received: from mail-pj1-x1031.google.com ([2607:f8b0:4864:20::1031]:52135)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1o0mMc-00031e-H9
 for qemu-devel@nongnu.org; Mon, 13 Jun 2022 11:52:27 -0400
Received: by mail-pj1-x1031.google.com with SMTP id cx11so6004845pjb.1
 for <qemu-devel@nongnu.org>; Mon, 13 Jun 2022 08:52:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=5DgRlsCxoN9bkalUqnw2erGL7IQHDQQ4iObLzReHoSI=;
 b=nkJAiEZtArgp2MoZqgKrUMmhIFGzFLs+Y6TQNOubKl3j0zpto3lXz60GoxoxmNave6
 EK3i9ue27BnOinFxBW6T1f1WD2qdK/g5EFIObDyf5+pjTFKs2fBfIa6Aez6DJqD1cv4M
 aI6FBE5ZtryGyeMGQTX8ELQT5UKfgSkg70XYTP9a3dVHDZjVBjNHOGDlbKIr/I74qxGg
 ppfotO6lwT6XGY84hgmUr/ME2aCRp9k41CPyf0NxNolzH7HQeOispfnBtMV+5e5THOKj
 VcAYNllYsg3Fpy6MtYnd3ZYbhlS5IxGZfzu123JIKb0Hs5Cq3vH6bHWe2R0FJfmZs2wa
 poHw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=5DgRlsCxoN9bkalUqnw2erGL7IQHDQQ4iObLzReHoSI=;
 b=48NKjOMqmIZKqleDFp4HYsROXY6YsoVNXnxjgfzXZCRGDA1ewnfG9ljEN/MJ9okRXe
 SMY7S2EUS2w8L8DqiNgB7ZsYecxEOgtJjlMxbx+KwU6JMRTSCvCfEJbWJTsaCpbFYs85
 I3SKcQXGRVeDxtngTiFWloKRGxVUOqC286sJPkBPMpTl0v3hIbg2p/W7LxjO4FI+VK3A
 /iXFmZG4etBGipZXWgSPmnu/x3Lor/vGx2jymVEv2ZGz9HLUSvrPb0AuTWGL3EJ0w3oE
 44vu4Sry7jVkpoRUCEbXCozciLWsBP6Xw4RdUPhqe9E60F/cHyrBAdSehU2Vaf8Y4PQ4
 WuhA==
X-Gm-Message-State: AJIora9bf6nW3L2unyFLEcoMxsdCeAkpboV5oj4fjbEgFVV1Y5I0hs+p
 6YwPOnHtLaZukIKa1BFarY+dQg==
X-Google-Smtp-Source: AGRyM1ubha0bGe1oEKe7F5ycVr8z5V2V2OEkRKUkD/yVVmiKMsFJwOMNv0AHYZzze4taNq5ayMAWEg==
X-Received: by 2002:a17:902:b683:b0:163:4ef2:3c40 with SMTP id
 c3-20020a170902b68300b001634ef23c40mr268488pls.123.1655135544401; 
 Mon, 13 Jun 2022 08:52:24 -0700 (PDT)
Received: from [172.21.2.253] ([50.208.55.229])
 by smtp.gmail.com with ESMTPSA id
 e11-20020a170902ed8b00b00163f8ddf160sm5320656plj.161.2022.06.13.08.52.22
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 13 Jun 2022 08:52:23 -0700 (PDT)
Message-ID: <37f8f623-bb1c-899b-5801-79acd6185c6d@linaro.org>
Date: Mon, 13 Jun 2022 08:52:21 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.1
Subject: Re: [PULL 00/16] Kraxel 20220613 patches
Content-Language: en-US
To: Gerd Hoffmann <kraxel@redhat.com>, qemu-devel@nongnu.org
Cc: "Michael S. Tsirkin" <mst@redhat.com>, xen-devel@lists.xenproject.org,
 Akihiko Odaki <akihiko.odaki@gmail.com>,
 "Hongren (Zenithal) Zheng" <i@zenithal.me>,
 Peter Maydell <peter.maydell@linaro.org>,
 Alex Williamson <alex.williamson@redhat.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 "Canokeys.org" <contact@canokeys.org>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
 Paul Durrant <paul@xen.org>, Anthony Perard <anthony.perard@citrix.com>
References: <20220613113655.3693872-1-kraxel@redhat.com>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20220613113655.3693872-1-kraxel@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1031;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1031.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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

On 6/13/22 04:36, Gerd Hoffmann wrote:
> The following changes since commit dcb40541ebca7ec98a14d461593b3cd7282b4fac:
> 
>    Merge tag 'mips-20220611' of https://github.com/philmd/qemu into staging (2022-06-11 21:13:27 -0700)
> 
> are available in the Git repository at:
> 
>    git://git.kraxel.org/qemu tags/kraxel-20220613-pull-request
> 
> for you to fetch changes up to 23b87f7a3a13e93e248eef8a4b7257548855a620:
> 
>    ui: move 'pc-bios/keymaps' to 'ui/keymaps' (2022-06-13 10:59:25 +0200)
> 
> ----------------------------------------------------------------
> usb: add CanoKey device, fixes for ehci + redir
> ui: fixes for gtk and cocoa, move keymaps (v2), rework refresh rate
> virtio-gpu: scanout flush fix

This doesn't even configure:

../src/ui/keymaps/meson.build:55:4: ERROR: File ar does not exist.




r~

