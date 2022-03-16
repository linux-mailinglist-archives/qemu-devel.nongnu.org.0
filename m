Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0BB164DA87E
	for <lists+qemu-devel@lfdr.de>; Wed, 16 Mar 2022 03:35:19 +0100 (CET)
Received: from localhost ([::1]:56290 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nUJVO-0007BQ-5C
	for lists+qemu-devel@lfdr.de; Tue, 15 Mar 2022 22:35:18 -0400
Received: from eggs.gnu.org ([209.51.188.92]:33924)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <xieyongji@bytedance.com>)
 id 1nUJTu-0006Jt-Ap
 for qemu-devel@nongnu.org; Tue, 15 Mar 2022 22:33:46 -0400
Received: from [2a00:1450:4864:20::62b] (port=44025
 helo=mail-ej1-x62b.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <xieyongji@bytedance.com>)
 id 1nUJTp-0002pJ-WE
 for qemu-devel@nongnu.org; Tue, 15 Mar 2022 22:33:43 -0400
Received: by mail-ej1-x62b.google.com with SMTP id d10so1345271eje.10
 for <qemu-devel@nongnu.org>; Tue, 15 Mar 2022 19:33:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bytedance-com.20210112.gappssmtp.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=qIHyvzETsHzQ4EdhckpeFY/OhyHahhJmX7czivybZmI=;
 b=RaORcajnc0+ssOyVHHufpSEJu7xhfyusotap3lqcxywc0Af/hMqgHlvXDVW5uMDtVO
 219zHSRJ9P4PJtyfoZVP3J4YmR4WEc/YeHJm7YF+/51BeeqiuaJwRn6DXExM2eUybBsS
 glu68xNuV9Klt5N7GnEzIxxC+BQXpy1WxxIU3j3iRsieeR5idoFw5t7rGZYvOlq171t7
 Hk+v6PlA7YJ0oM9mOnYnetNsI14Qvk0BVBzb/JVejORLUCE0q4PjDF2FwfVDMGbgnSwx
 k/1tv9p76ZtdOkl91Kn3zF3WyLl1fkhLa6dd4dqs0BeX/hOyjCR49vdpo2JNmj1C2hSy
 ZNqA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=qIHyvzETsHzQ4EdhckpeFY/OhyHahhJmX7czivybZmI=;
 b=WAN8fcWzKXfaNQ5HGr3qkTY/6uTJXxsykLTCRlJ1UleCSCxg8fW6zvHLkJF1azNwkN
 oor7g84O+c1+oCUyMAQQ+0YV6CAKWTsammafwlNkkofbs04HGvLLSehyJ4SPslpGZl3i
 RUpvY46kJrx5SzEggEtldccq//+/Qr6/TeZy+CquagB/Z28Oka8zj9E79xYBtSwMVb/G
 lgWyKBF4D+V0qduwfC9N5r6cWov0HOBG6oP8IQ25G/qWpmmBhoAf0OaM1y7yx+idG+lh
 035Gg6I7rMtfL4d/hDpAXblWz8EsbadG/cgkWq7vrAiJ1aioP8TQ/36bOvx/1RaqbEBR
 XEGw==
X-Gm-Message-State: AOAM530w2FC1xAn0vdZqJi+YUl3xWY4W8FAJZIdB7U8J3PeYAejR9KCf
 WNpqpCm3zod9egI0vmUZqvmp1XsQWLpY8+nj5k3M
X-Google-Smtp-Source: ABdhPJw3Gryxa4olnZvSDsIdT9S9FaZ9zpoWXrk7G0hciEZ11EOCPdOOEvp5Zpww6v/2oHAJQ8vm71dohYjYjFaeUCo=
X-Received: by 2002:a17:906:974e:b0:6bb:4f90:a6ae with SMTP id
 o14-20020a170906974e00b006bb4f90a6aemr26222470ejy.452.1647398019098; Tue, 15
 Mar 2022 19:33:39 -0700 (PDT)
MIME-Version: 1.0
References: <20220215105943.90-1-xieyongji@bytedance.com>
 <20220215105943.90-7-xieyongji@bytedance.com>
 <YjCZQJh8xrY5lCuu@stefanha-x1.localdomain>
In-Reply-To: <YjCZQJh8xrY5lCuu@stefanha-x1.localdomain>
From: Yongji Xie <xieyongji@bytedance.com>
Date: Wed, 16 Mar 2022 10:33:33 +0800
Message-ID: <CACycT3trb=r14P8vtzT-vb-_icdn5fL9qTLhB_Nf3ZSAv7MY6Q@mail.gmail.com>
Subject: Re: [PATCH v2 6/6] libvduse: Add support for reconnecting
To: Stefan Hajnoczi <stefanha@redhat.com>
Content-Type: text/plain; charset="UTF-8"
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::62b
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::62b;
 envelope-from=xieyongji@bytedance.com; helo=mail-ej1-x62b.google.com
X-Spam_score_int: -4
X-Spam_score: -0.5
X-Spam_bar: /
X-Spam_report: (-0.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, PDS_HP_HELO_NORDNS=0.659, RCVD_IN_DNSWL_NONE=-0.0001,
 RDNS_NONE=0.793, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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
Cc: Kevin Wolf <kwolf@redhat.com>, qemu-block@nongnu.org,
 "Michael S. Tsirkin" <mst@redhat.com>, Jason Wang <jasowang@redhat.com>,
 qemu-devel@nongnu.org, mreitz@redhat.com, mlureau@redhat.com,
 Stefano Garzarella <sgarzare@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Tue, Mar 15, 2022 at 9:48 PM Stefan Hajnoczi <stefanha@redhat.com> wrote:
>
> On Tue, Feb 15, 2022 at 06:59:43PM +0800, Xie Yongji wrote:
> > +static int vduse_queue_inflight_get(VduseVirtq *vq, int desc_idx)
> > +{
> > +    vq->log->inflight.desc[desc_idx].counter = vq->counter++;
> > +    vq->log->inflight.desc[desc_idx].inflight = 1;
>
> Is a barrier needed between these two lines to prevent inflight = 1 with
> an undefined counter value?

Yes, I will fix it in v3.

Thanks,
Yongji

