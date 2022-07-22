Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E442857E08E
	for <lists+qemu-devel@lfdr.de>; Fri, 22 Jul 2022 13:08:07 +0200 (CEST)
Received: from localhost ([::1]:54024 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oEqVq-0000sd-5i
	for lists+qemu-devel@lfdr.de; Fri, 22 Jul 2022 07:08:06 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37136)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1oEqOQ-0005mo-6H
 for qemu-devel@nongnu.org; Fri, 22 Jul 2022 07:00:26 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:41492)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1oEqOL-0001Jf-GM
 for qemu-devel@nongnu.org; Fri, 22 Jul 2022 07:00:24 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1658487617;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:in-reply-to:in-reply-to:  references:references;
 bh=Vw6ROPM4hCJQ2GoaXu6iKeFPrPa7wtXcE+10AM4X/LI=;
 b=aP+ZRK/DV3MdRzFq3wj6GKhPP1Xeo9g9y2Kix+49FrDzNatykNnGWhRfxDSz1U4lzDD7im
 soZMnNXAlS6fJTNcWDuhyzaFPIO0EmlrPtMnE2SemNHCYKNdbSL6UqXQkJM+fnYbrWmah7
 F+tXf2uJAzveAIWMB7f4/UdtCQNaKro=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-479-NYKcyCMINqq_Wt7I77Sgiw-1; Fri, 22 Jul 2022 07:00:16 -0400
X-MC-Unique: NYKcyCMINqq_Wt7I77Sgiw-1
Received: by mail-wm1-f69.google.com with SMTP id
 bh18-20020a05600c3d1200b003a32044cc9fso2357093wmb.6
 for <qemu-devel@nongnu.org>; Fri, 22 Jul 2022 04:00:15 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:in-reply-to:references
 :user-agent:reply-to:date:message-id:mime-version;
 bh=Vw6ROPM4hCJQ2GoaXu6iKeFPrPa7wtXcE+10AM4X/LI=;
 b=dlQlU7/Lk/+JKPbLcXZVkExW0eBiPbu+WXjJGL3nYlSsiTN2D/vun4aQNTAD7dHtxp
 +WYo6DEGbEE8D28UTtLblDvjvkSzycSaDnsFdz8TxCsVeSakcJKzoa8FVwAMjg9rENBu
 ygnFJqWz5O/3mzUuuLEIQT2uSfMxo1p4GM+BCujJjU4LXuXKMyDM2zBbHAHiHSHp3jbv
 2aXBcvKZMYmdwKxtaE0U7mzyyD+X/U3LXgGzVo+3ISe4c/XD68CyzX8GJBafjjJgopRB
 j2KiG+HpnmnVVLRBRgKN7gIYbW0VRq6vgZ1Q0Wjxx+mm04Tyx3xewYSrqdqU7AFFbhuL
 iYYQ==
X-Gm-Message-State: AJIora/FR++XFeLUGVT/tmH/6ekmVkmpgcDjJW1Vp1/oVGqoRS+koOUn
 ByvCG3D7vwwNG4bIfrZajFuaaiLFteYgcm2Vq7eDuRHabIXka8CtR3ompaTXFbMQGpiH57Qrrwq
 W4Zz5VRmBGG3PBLY=
X-Received: by 2002:adf:eace:0:b0:21d:6e90:2bf8 with SMTP id
 o14-20020adfeace000000b0021d6e902bf8mr2033062wrn.349.1658487614838; 
 Fri, 22 Jul 2022 04:00:14 -0700 (PDT)
X-Google-Smtp-Source: AGRyM1tTD6daOeaWTOhtjveZQ2zCROgaz17PwR1ZQgiPl7j4wQVJnW7TaMunGjyZwTQDahArC8I9jg==
X-Received: by 2002:adf:eace:0:b0:21d:6e90:2bf8 with SMTP id
 o14-20020adfeace000000b0021d6e902bf8mr2033043wrn.349.1658487614556; 
 Fri, 22 Jul 2022 04:00:14 -0700 (PDT)
Received: from localhost (84.125.126.120.dyn.user.ono.com. [84.125.126.120])
 by smtp.gmail.com with ESMTPSA id
 j22-20020a05600c485600b003a2c7bf0497sm4796580wmo.16.2022.07.22.04.00.13
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 22 Jul 2022 04:00:13 -0700 (PDT)
From: Juan Quintela <quintela@redhat.com>
To: Peter Maydell <peter.maydell@linaro.org>
Cc: qemu-devel@nongnu.org,  qemu-block@nongnu.org,  "Dr. David Alan Gilbert"
 <dgilbert@redhat.com>,  Fam Zheng <fam@euphon.net>,  Stefan Hajnoczi
 <stefanha@redhat.com>
Subject: Re: [PATCH 1/2] migration: Assert that
 migrate_multifd_compression() returns an in-range value
In-Reply-To: <20220721115207.729615-2-peter.maydell@linaro.org> (Peter
 Maydell's message of "Thu, 21 Jul 2022 12:52:06 +0100")
References: <20220721115207.729615-1-peter.maydell@linaro.org>
 <20220721115207.729615-2-peter.maydell@linaro.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.1 (gnu/linux)
Date: Fri, 22 Jul 2022 13:00:12 +0200
Message-ID: <87pmhx5s5f.fsf@secure.mitica>
MIME-Version: 1.0
Content-Type: text/plain
Received-SPF: pass client-ip=170.10.129.124; envelope-from=quintela@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
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
Reply-To: quintela@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Peter Maydell <peter.maydell@linaro.org> wrote:
> Coverity complains that when we use the return value from
> migrate_multifd_compression() as an array index:
>   multifd_recv_state->ops = multifd_ops[migrate_multifd_compression()];
>
> that this might overrun the array (which is declared to have size
> MULTIFD_COMPRESSION__MAX).  This is because the function return type
> is MultiFDCompression, which is an autogenerated enum.  The code
> generator includes the "one greater than the maximum possible value"
> MULTIFD_COMPRESSION__MAX in the enum, even though this is not
> actually a valid value for the enum, and this makes Coverity think
> that migrate_multifd_compression() could return that __MAX value and
> index off the end of the array.
>
> Suppress the Coverity error by asserting that the value we're going
> to return is within range.
>
> Resolves: Coverity CID 1487239, 1487254
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>

Reviewed-by: Juan Quintela <quintela@redhat.com>


