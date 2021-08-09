Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1A6233E4313
	for <lists+qemu-devel@lfdr.de>; Mon,  9 Aug 2021 11:44:59 +0200 (CEST)
Received: from localhost ([::1]:39454 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mD1q6-00058B-5S
	for lists+qemu-devel@lfdr.de; Mon, 09 Aug 2021 05:44:58 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49180)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1mD1oB-0002cR-CD
 for qemu-devel@nongnu.org; Mon, 09 Aug 2021 05:43:01 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:50782)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1mD1oA-0006Oe-1w
 for qemu-devel@nongnu.org; Mon, 09 Aug 2021 05:42:59 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1628502177;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=phHGFTgZcZXvvM5+o9c+ifc0Qj+hb69JthB2fj1Y7wY=;
 b=FlN1snQGTrBSpEXJXbvA9DHj6yRc1DHR8WmRE8r1T3BkvJMep0sxBuJxPBQUgNLZFMbA4P
 /MZYcpWsl68lqzbhxlBVV+ONqmnYyzAmpM0/CUN0DEBMcImbJZwoAMYmVhMM/fmVPzkE2Z
 Lt2KtjfKZkenkxI0zMDoxZonX7J9GhU=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-517-nM5irSTiOdG4dJoFE8xx_Q-1; Mon, 09 Aug 2021 05:42:54 -0400
X-MC-Unique: nM5irSTiOdG4dJoFE8xx_Q-1
Received: by mail-wr1-f69.google.com with SMTP id
 p12-20020a5d68cc0000b02901426384855aso5168535wrw.11
 for <qemu-devel@nongnu.org>; Mon, 09 Aug 2021 02:42:54 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=phHGFTgZcZXvvM5+o9c+ifc0Qj+hb69JthB2fj1Y7wY=;
 b=WMLqXYGadfoNbccKSu2XSK29CkkADRAp942WcOaauHVQEJ6++yk35DJJ29H/VW8uQM
 6w6LWhkevFLRdtNbaW+h0nUILsxk7KewbhLPDYjMoJfjyUn2owD9OfW2m3clEfe1XAYx
 9QBMHAm3UfLBT51xqn6HrytuVh7xhJ1iqRDCaqBh/VlQuL+q+CWRzryMW2+xhhgnZyMa
 JLqgUm0EMNgh61s6Ec743eoygj+uNq7p5yecbLtCdKppucwVhNFIFB2s92v/0JrhhtVq
 XSMLEG8Mk8QKNY+3tR4vA7xnzv8OoW4p5bSxeuy5E5ZH0Rc7p6MCGr6eQg9OsiDjYNwR
 k/oA==
X-Gm-Message-State: AOAM533qTBRrxGQtLsvuTGeD5aHwJIDMgp0/u530z9Z1/2OgXJQW3jDa
 3oObtVrWEKCUOe1YDqVYDtEnwu/BGPwpeA9I6drL/z7tc5Uo/TRk23amgoeXVSgPlA9yIUnmSvT
 n199hnhzJ9RQOj/c=
X-Received: by 2002:a7b:ce08:: with SMTP id m8mr33100232wmc.21.1628502173396; 
 Mon, 09 Aug 2021 02:42:53 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyyekikwqdNOgUUP+PPnV1Po4VVaXYe2NlvA+uk23movYvrFVcdcuqc1PVDbMEOtF2Bo+fYtg==
X-Received: by 2002:a7b:ce08:: with SMTP id m8mr33100212wmc.21.1628502173238; 
 Mon, 09 Aug 2021 02:42:53 -0700 (PDT)
Received: from [192.168.1.36] (163.red-83-52-55.dynamicip.rima-tde.net.
 [83.52.55.163])
 by smtp.gmail.com with ESMTPSA id 129sm17119071wmz.26.2021.08.09.02.42.52
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 09 Aug 2021 02:42:52 -0700 (PDT)
Subject: Re: [PATCH v2] hw/display/xlnx_dp: fix an out-of-bounds read in
 xlnx_dp_read
To: Qiang Liu <cyruscyliu@gmail.com>, Peter Maydell <peter.maydell@linaro.org>
References: <1628059910-12060-1-git-send-email-cyruscyliu@gmail.com>
 <20210806144209.nbx4vlm6ofkza5pl@mozz.bu.edu>
 <CAFEAcA9Qn+PMGWRLtBdPXWpzz=JzoNc+XiaEpPXGv4Wb+YX3=A@mail.gmail.com>
 <CAAKa2j=zjGEEcfSz4fv=wOW6+OajXQp1Gy=VYjbH5QMrBXNHMg@mail.gmail.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Message-ID: <cefaded8-e2cb-3a73-131c-01ad5505933c@redhat.com>
Date: Mon, 9 Aug 2021 11:42:52 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <CAAKa2j=zjGEEcfSz4fv=wOW6+OajXQp1Gy=VYjbH5QMrBXNHMg@mail.gmail.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.707,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: Laurent Vivier <lvivier@redhat.com>, Thomas Huth <thuth@redhat.com>,
 Alistair Francis <alistair@alistair23.me>,
 "open list:All patches CC here" <qemu-devel@nongnu.org>,
 Alexander Bulekov <alxndr@bu.edu>, Bandan Das <bsd@redhat.com>,
 "open list:Xilinx ZynqMP and..." <qemu-arm@nongnu.org>,
 Stefan Hajnoczi <stefanha@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 8/9/21 11:33 AM, Qiang Liu wrote:
> Thank you for all the insightful comments about the separated patches.
> This would be my first time to format a serial of patches. Does it
> look like below?

> [PATCH v3 00/2] title
>      [PATCH v3 01/2] fix
>      [PATCH v3 02/2] test

Exactly. Otherwise, adding the test before the fix would
make an incremental build to fail.


