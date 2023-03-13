Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C3A776B7F53
	for <lists+qemu-devel@lfdr.de>; Mon, 13 Mar 2023 18:22:12 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pblrF-0003lb-3e; Mon, 13 Mar 2023 13:21:14 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alxndr@bu.edu>) id 1pblrB-0003lO-39
 for qemu-devel@nongnu.org; Mon, 13 Mar 2023 13:21:09 -0400
Received: from esa11.hc2706-39.iphmx.com ([216.71.137.81])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alxndr@bu.edu>) id 1pblr9-0004wv-FX
 for qemu-devel@nongnu.org; Mon, 13 Mar 2023 13:21:08 -0400
X-IronPort-RemoteIP: 209.85.222.199
X-IronPort-MID: 265210912
X-IronPort-Reputation: None
X-IronPort-Listener: OutgoingMail
X-IronPort-SenderGroup: RELAY_GSUITE
X-IronPort-MailFlowPolicy: $RELAYED
IronPort-Data: A9a23:2hcvF6OxtigxKmTvrR0blcFynXyQoLVcMsEvi/4bfWQNrUpxgjwOx
 zYbXmGFPKrbYzCjfttyO4m18R4AvsWGyoBqQQZtpSBmQkwRlceUXt7xwmUcns+xwm8vaGo9s
 q3yv/GZdJhcokf0/0vraf656yEnj8lkf5KkYMbcICd9WAR4fykojBNnioYRj5VhxNO0GGthg
 /uryyHkEALjim4c3l48sfrZ80s05a+q41v0g3RlDRx1lA6G/5UqJM9HTU2BByOQapVZGOe8W
 9HCwNmRlo8O105wYj8Nuu+TnnwiG9Y+DyDX4pZlc/HKbix5m8AH+v1T2MzwyKtgo27hc9hZk
 L2hvHErIOsjFvSkdO81CnG0H8ziVEHvFXCuzXWX6KSuI0P6n3TE3fpfKmxnPt0j++NYMThe0
 fofFQsBcUXW7w626OrTpuhEg80iKIzyP9patCgxnHfWCvEpRZ2FSKLPjTNa9G1o14YeQLCEP
 ZBfMGs+BPjDS0Qn1lM/AZYumuuyrnPiNTBUtTp5oIJtvTWJlVQgieKF3Nz9VsGUQNRXnH2hn
 Gfm0mX2CBI6LOWPxm/Qmp6rrqqV9c/hY6oLGbils/JnnlCX7moUDhIQSB28u/bRt6Klc9dWK
 khR4yl36KZrpR3tQd76UBm15nWDu3bwRuZtLgHz0ynVooK83upTLjNsouJpADD+iPILeA==
IronPort-HdrOrdr: A9a23:qLSNzK7z2ooBOscGvAPXwATXdLJyesId70hD6qm+c20zTiW9rb
 HSoB19726JtN9xYgBbpTnkAsO9qBznhPxICOUqTNKftUzdyRSVxeJZnPDfKl/balTDH4dmvM
 8KAstD4Z/LfCBHZK7BgDVQeOxQpuVvnprY4dv2/jNGYTsvRZtdzzpUPC6mL2wefng5OXP7Lv
 ahDwh8ygZItU54Ui1zPBZlY9T+
Received: from mail-qk1-f199.google.com ([209.85.222.199])
 by ob1.hc2706-39.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 13 Mar 2023 13:21:02 -0400
Received: by mail-qk1-f199.google.com with SMTP id
 d4-20020a05620a166400b00742859d0d4fso6943644qko.15
 for <qemu-devel@nongnu.org>; Mon, 13 Mar 2023 10:21:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bu.edu; s=s1gsbu; t=1678728061;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date:from:to
 :cc:subject:date:message-id:reply-to;
 bh=IwrXtu3AWQTy4d/gIM/Mz05WsoamxIZITq24k3CTv7I=;
 b=Pq8bQJNQlzQ6chpaxz/IFmWUCL2DznfIDSZgzB0aBwUdA+UHkCxNE0tSJJEkqd8QMw
 /96lUoJql9CVKHuDBnVSK/SJcRA7Pz8P7K+2cpCJVa0Ge5vIxmaUdadzjFK4VmAjIzpN
 6UP4KlUsOUUpUwl1zv/BBxu8i1ossn19aF+NEiri0R5NqEQOMsKKQWkgbS1mQbuPLcX8
 GEAwYUYv87QSkPvgp2LK01+s1yyvInhF7cNFVwupVj5QqqCAMSh7lMmRIr1WatSkuGrr
 X6Tkpb4qcg8goFXzz/mtBJfc7K+gPlkwkojUpAWjK4vk7WYwRo7jv1uVJ6LeoyOsu3YD
 9IRQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1678728061;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=IwrXtu3AWQTy4d/gIM/Mz05WsoamxIZITq24k3CTv7I=;
 b=n2YVquwOR85UzSaOWkeuh4juSoKNHU661a7bzNgmK+ijqdTYXo74wNy7JJ2Z/ZMUkY
 DXDM8Rq+Q9vjX5Sq82JskV9x12CiPoA11mVdpmmTlLBwmXLFwwElnID4g8dFVlPkdzoQ
 6ztLJRGhRmRRzHIz3H9hsvrCXJFAeVXv/qyOTk+1F2zHgG2jQ72WfTVGeMYw7G5HgFtf
 J80mHfsBGuyj3CuefoxuJ5TLlz1yL8kVfl2PUkTb7CPEyO6Bjg1izmpOGBAaBv89kvmw
 ZJt5AVNKeJqBXjC0NV+P3A3Unyv6PhYDT9vjzluXszg7DsbOZ1kygKV6UslCCaxbJLva
 xmTw==
X-Gm-Message-State: AO0yUKXmGFpLRU5G6OmmMekPAws8QhamZBSQa/Vxa/i5XQAd0nS+JtD3
 QFIe0sHmfx0U4QHNGo/K6qUinEdQgpx4PVF42TanXAmaqrKSbsVykBYDII3rmcl5T873cFm5Mbt
 VkvaT2uc/8HkBnttv0R9utV7/7fbmiw==
X-Received: by 2002:a05:6214:f23:b0:572:dbc8:23f6 with SMTP id
 iw3-20020a0562140f2300b00572dbc823f6mr16262737qvb.45.1678728061651; 
 Mon, 13 Mar 2023 10:21:01 -0700 (PDT)
X-Google-Smtp-Source: AK7set8RrClDJXkrZUnwPrvNQF/RftO7A4S5t4qihFrmmxm4ggzsGNPN8hxvX/fUT/nns3Fb7w/9pQ==
X-Received: by 2002:a05:6214:f23:b0:572:dbc8:23f6 with SMTP id
 iw3-20020a0562140f2300b00572dbc823f6mr16262688qvb.45.1678728061262; 
 Mon, 13 Mar 2023 10:21:01 -0700 (PDT)
Received: from mozz.bu.edu (mozz.bu.edu. [128.197.127.33])
 by smtp.gmail.com with ESMTPSA id
 d3-20020a37b403000000b007426ec97253sm59720qkf.111.2023.03.13.10.21.00
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 13 Mar 2023 10:21:00 -0700 (PDT)
Date: Mon, 13 Mar 2023 13:20:57 -0400
From: Alexander Bulekov <alxndr@bu.edu>
To: Peter Maydell <peter.maydell@linaro.org>
Cc: Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Thomas Huth <thuth@redhat.com>, qemu-devel@nongnu.org,
 Stefan Hajnoczi <stefanha@redhat.com>,
 Mauro Matteo Cascella <mcascell@redhat.com>,
 Peter Xu <peterx@redhat.com>, Jason Wang <jasowang@redhat.com>,
 David Hildenbrand <david@redhat.com>, Gerd Hoffmann <kraxel@redhat.com>,
 Laurent Vivier <lvivier@redhat.com>, Bandan Das <bsd@redhat.com>,
 "Edgar E . Iglesias" <edgar.iglesias@gmail.com>,
 Darren Kenny <darren.kenny@oracle.com>, Bin Meng <bin.meng@windriver.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 "Michael S . Tsirkin" <mst@redhat.com>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>,
 Eduardo Habkost <eduardo@habkost.net>,
 Jon Maloy <jmaloy@redhat.com>, Siqi Chen <coc.cyqh@gmail.com>
Subject: Re: [PATCH v7 0/6] memory: prevent dma-reentracy issues
Message-ID: <20230313172057.7gknyrgdo5rfece3@mozz.bu.edu>
References: <20230313082417.827484-1-alxndr@bu.edu>
 <c61ecf23-d055-01a8-b2d7-37367c4c1f63@redhat.com>
 <20230313145228.6hcgsuobgaxbyr5o@mozz.bu.edu>
 <38b1989e-248d-88fb-2551-13c895999841@linaro.org>
 <CAFEAcA95qnh=B3DYTTi_65gF3geErw4gKZ3g3y3zd2tVp_A0aQ@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAFEAcA95qnh=B3DYTTi_65gF3geErw4gKZ3g3y3zd2tVp_A0aQ@mail.gmail.com>
X-CES-GSUITE_AUTH: bf3aNvsZpxl8
Received-SPF: pass client-ip=216.71.137.81; envelope-from=alxndr@bu.edu;
 helo=esa11.hc2706-39.iphmx.com
X-Spam_score_int: 0
X-Spam_score: -0.1
X-Spam_bar: /
X-Spam_report: (-0.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 HK_RANDOM_ENVFROM=0.999, HK_RANDOM_FROM=1, SPF_HELO_PASS=-0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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

On 230313 1608, Peter Maydell wrote:
> On Mon, 13 Mar 2023 at 15:41, Philippe Mathieu-Daudé <philmd@linaro.org> wrote:
> > Now I wonder again if this is a good time to merge this change set.
> 
> No, I don't think it is at this point in the release
> cycle. I would vote for merging it when we reopen for 8.1,
> so that we'll have a full cycle to find all the weird corner
> cases that it breaks.

Ok. I'll fix the rasbpi issue and look into adding some compile-time
option to make the re-entrancy check fatal. That way we might catch
additional edge-cases with fuzzing (though non-x86 coverage is poor) and
unit-tests.
-Alex

