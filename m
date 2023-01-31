Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3EAFC682389
	for <lists+qemu-devel@lfdr.de>; Tue, 31 Jan 2023 05:51:47 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pMibC-0003DJ-AR; Mon, 30 Jan 2023 23:50:26 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jeb.study@gmail.com>)
 id 1pMibB-0003DB-6h
 for qemu-devel@nongnu.org; Mon, 30 Jan 2023 23:50:25 -0500
Received: from mail-qt1-x82e.google.com ([2607:f8b0:4864:20::82e])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <jeb.study@gmail.com>)
 id 1pMib9-0000A1-Ig
 for qemu-devel@nongnu.org; Mon, 30 Jan 2023 23:50:24 -0500
Received: by mail-qt1-x82e.google.com with SMTP id h24so4271033qtr.0
 for <qemu-devel@nongnu.org>; Mon, 30 Jan 2023 20:50:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:in-reply-to:references:cc:to:from
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=rkKI0rCOTtdledtroLVPNMyJtN/heT1rhuCjf4aNb84=;
 b=A22yWyv6nWUIQEZ1AQ4EYltu9aAQ9m4jD3CnV699E+gFZb24ssN/v3d7B7UIArGkM5
 GNoQbgZd6PQVD5qc+ffb5BYag0tuUzKrhd/YDUgwKa9/JS9xfEFf0/yQZ3i4hYOmHfiY
 ycmyEoICduamRifpbZLhzGGsfrk9TGDGANpWz64cdiH71PD1ghBDIGc4EyEql4zXP7Kr
 LDnP7UYbhVkLKsB7AWeGrcy+CBZoezhhfV9UXt2KF1ZPca14ZMPNFVLpExYrNduc4VAK
 CGvA6lENisHNlwPra4uwj7Ds0fmb5rSsnUKJFoTiHZ9L2si7ThRR5V0dJHno2bQs44JY
 wJ2w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:references:cc:to:from
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=rkKI0rCOTtdledtroLVPNMyJtN/heT1rhuCjf4aNb84=;
 b=PsIggrpMukAfiErBPHPExQROQ+QKo/sIH4ZnXfQzTF2yBGRQLEIVzuavEKJ4f2Mlf3
 gSuvss5kAo8br03lTy88KY1nFwLLlLnXgW4m0Kvrp8Sm5EJx5u6OpS2ht7py2tMGDSS/
 fGukgr14YqGR2d7gHwl4gQ6wvRTrBQnwaKGL14m3JhDj6pFivcEwZJCVmPbLU5/i6b/l
 OQMwglU40p53X2LrNPqSyvnJrZlg+w4qlEVnyrdnkm4TgSSg3SoVdO6zpea/AZwnipan
 9z1lAu7TTXqP/aI1DDk7JqIRAIr0N3RpVkMJntFKyA4XCfdMRNe6sHOFFl7yO4AlgY8j
 lr9A==
X-Gm-Message-State: AFqh2kquwIS2jpKHU9SZXw+MU1T6WK0tCcg1bujLu4Mhc0hKDh/hy+tH
 J041irygnJbFEclxC0Kx21o=
X-Google-Smtp-Source: AMrXdXuTMs1sLO+rCjKWSAMiuGR9TyvIQFBjOh+oyKGxy3DesjqzlaaW+/QKCAAF0HxaBEW506nlNg==
X-Received: by 2002:ac8:71c4:0:b0:3a7:f3f0:483 with SMTP id
 i4-20020ac871c4000000b003a7f3f00483mr65355151qtp.60.1675140621787; 
 Mon, 30 Jan 2023 20:50:21 -0800 (PST)
Received: from [172.26.92.72] ([199.111.213.113])
 by smtp.gmail.com with ESMTPSA id
 c23-20020a05620a165700b006ec62032d3dsm9273975qko.30.2023.01.30.20.50.21
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 30 Jan 2023 20:50:21 -0800 (PST)
Message-ID: <377c3494-27b9-5e06-d524-b024f1b7ffa6@gmail.com>
Date: Mon, 30 Jan 2023 23:50:20 -0500
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.1
Subject: Re: [PATCH v2] Fix exec migration on Windows (w32+w64).
Content-Language: en-US
From: "John Berberian, Jr." <jeb.study@gmail.com>
To: =?UTF-8?Q?Daniel_P=2e_Berrang=c3=a9?= <berrange@redhat.com>,
 =?UTF-8?Q?Marc-Andr=c3=a9_Lureau?= <marcandre.lureau@gmail.com>
Cc: qemu-devel@nongnu.org, Stefan Weil <sw@weilnetz.de>,
 Juan Quintela <quintela@redhat.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>
References: <20230116013421.3149183-1-jeb.study@gmail.com>
 <CAJ+F1C+x3tSHAb6LbL+GK0m08UuKCS0RWygz41gMFycqL0JrrQ@mail.gmail.com>
 <Y8UXR6uqdv22auoE@redhat.com>
 <db09ab65-a6a7-0096-625a-c323a4b5aacf@gmail.com>
In-Reply-To: <db09ab65-a6a7-0096-625a-c323a4b5aacf@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::82e;
 envelope-from=jeb.study@gmail.com; helo=mail-qt1-x82e.google.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 NICE_REPLY_A=-0.09, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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

ping.
As requested in the wiki, here's the patchew link:
https://patchew.org/QEMU/20230116013421.3149183-1-jeb.study@gmail.com/

