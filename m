Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 770FD68ECDF
	for <lists+qemu-devel@lfdr.de>; Wed,  8 Feb 2023 11:30:22 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pPhi1-0007Yu-HS; Wed, 08 Feb 2023 05:29:49 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alvaro.karsz@solid-run.com>)
 id 1pPhhx-0007Yd-8K
 for qemu-devel@nongnu.org; Wed, 08 Feb 2023 05:29:45 -0500
Received: from mail-pl1-x629.google.com ([2607:f8b0:4864:20::629])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alvaro.karsz@solid-run.com>)
 id 1pPhhv-0003aD-1o
 for qemu-devel@nongnu.org; Wed, 08 Feb 2023 05:29:44 -0500
Received: by mail-pl1-x629.google.com with SMTP id g17so1253841ply.11
 for <qemu-devel@nongnu.org>; Wed, 08 Feb 2023 02:29:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=solid-run-com.20210112.gappssmtp.com; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=Uw2ZicEA5RLzfShMXQ1dwaKNDb+ZvEQ5nofhk/pEKE8=;
 b=qNvBsfjNBF1TkmnJTB3tUs4ujn+RLEV1Twl1prVx+53gUaxKFIy+mCCT33Cg+gE5tn
 YTdT/tgxI8JWYnb8kl1KE8f7JQWbSioraFlguQvUmbyuBrXhFrKebzHO0S6MeuaQJfv0
 bYgsluSWWVbKreOBmLyRvaoaNDEj70uvFKRzk5sEUhhHaL2MRuZcHDpFbQKSbJxMRacu
 gu9XR6iUMFR9ZzbRUfHW8mHUezeg0H0j0MQM8mU739C2b9DtqwRROw5VF8PvEwqUNiEB
 O/QCPyZB18cjx8JUBDwZUaQjnEH2/jbXrpkpJhr0zqmxU79zMu3Z0+anu8mNzDXqA0f5
 5lzA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=Uw2ZicEA5RLzfShMXQ1dwaKNDb+ZvEQ5nofhk/pEKE8=;
 b=lgl4KN0fAbIV4VsCb0DoCCOul6vdXbOkUElHu7MZfJcpct6Z8k8WTNhKQMOrIzNPJ9
 zh8Ge5pCPMUWB26p7xpo0MlVCGR5xs0NUNVA+7ymDLtFEinXuzB4jBflQX0AFg/rokYL
 wDHiuqvCPE6eV5j+kHZOCjzicKbfjTKH+LSyqm5W0sNwXNCccttYZ6uXO9FJMFmZP5IO
 f6nTh8mmKtI84jJyFhQxGqHmYqVkUHc6BS61DQk+6tRE9ix+jokOMNEr00kEpHhc1u8D
 0Q4bRMhhNGHcKfE43qlw4i07Mf3GP1DklGiPOXBNNM3W3FeE0mX/G94vsbMsk6T6XG/Z
 cH0w==
X-Gm-Message-State: AO0yUKXP/nxFKH/Y4JZ4n9zxyhdTfoct/R8hWQO1xgtL+flQC4yN81FW
 elb1RuYrdK+hbL1Gh3AFcp22/aYxI+l+7XYyeNTc/Q==
X-Google-Smtp-Source: AK7set/D85OP4MbEUttLin1Mc4kBwGa/GSqWKwYp9esG56LQONCdHonoSsb/1780I1mBh093u4BaKZgg9Akx7nlrlwU=
X-Received: by 2002:a17:90a:764d:b0:230:c6fa:9305 with SMTP id
 s13-20020a17090a764d00b00230c6fa9305mr600415pjl.93.1675852181066; Wed, 08 Feb
 2023 02:29:41 -0800 (PST)
MIME-Version: 1.0
References: <20230208094253.702672-1-eperezma@redhat.com>
In-Reply-To: <20230208094253.702672-1-eperezma@redhat.com>
From: Alvaro Karsz <alvaro.karsz@solid-run.com>
Date: Wed, 8 Feb 2023 12:29:03 +0200
Message-ID: <CAJs=3_DQQPGUYK_Fv4tuiVcdJ6V1dtRjRkUL3_EqNhwJt-+kYg@mail.gmail.com>
Subject: Re: [PATCH v2 00/13] Dynamycally switch to vhost shadow virtqueues at
 vdpa net migration
To: =?UTF-8?Q?Eugenio_P=C3=A9rez?= <eperezma@redhat.com>
Cc: qemu-devel@nongnu.org, Harpreet Singh Anand <hanand@xilinx.com>, 
 "Gonglei (Arei)" <arei.gonglei@huawei.com>,
 "Michael S. Tsirkin" <mst@redhat.com>, 
 Jason Wang <jasowang@redhat.com>, Cindy Lu <lulu@redhat.com>, 
 Zhu Lingshan <lingshan.zhu@intel.com>, Lei Yang <leiyang@redhat.com>, 
 Liuxiangdong <liuxiangdong5@huawei.com>, Shannon Nelson <snelson@pensando.io>, 
 Parav Pandit <parav@mellanox.com>, Gautam Dawar <gdawar@xilinx.com>,
 Eli Cohen <eli@mellanox.com>, 
 Stefan Hajnoczi <stefanha@redhat.com>, Laurent Vivier <lvivier@redhat.com>,
 longpeng2@huawei.com, virtualization@lists.linux-foundation.org, 
 Stefano Garzarella <sgarzare@redhat.com>, si-wei.liu@oracle.com
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::629;
 envelope-from=alvaro.karsz@solid-run.com; helo=mail-pl1-x629.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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

HI Eugenio, thanks for the series!

I tested the series with our DPU, SolidNET.

The test went as follow:

- Create 2 virtio net vdpa devices, every device in a separated VF.
- Start 2 VMs with the vdpa device as a single network device, without
shadow vq.
   The source VM with "-netdev
vhost-vdpa,vhostdev=/dev/vhost-vdpa-0,id=hostnet0"
   The destination VM with "-netdev
vhost-vdpa,vhostdev=/dev/vhost-vdpa-1,id=hostnet0"
- Boot the source VM, test the network by pinging.
- Migrate
- Test the destination VM network.

Everything worked fine.

Tested-by: Alvaro Karsz <alvaro.karsz@solid-run.com>

