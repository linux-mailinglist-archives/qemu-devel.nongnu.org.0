Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5EDDD66C649
	for <lists+qemu-devel@lfdr.de>; Mon, 16 Jan 2023 17:18:02 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pHSA3-0006YA-L7; Mon, 16 Jan 2023 11:16:39 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@gmail.com>)
 id 1pHS9t-0006Us-JC
 for qemu-devel@nongnu.org; Mon, 16 Jan 2023 11:16:32 -0500
Received: from mail-yw1-x112a.google.com ([2607:f8b0:4864:20::112a])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <stefanha@gmail.com>)
 id 1pHS9o-0000AY-11
 for qemu-devel@nongnu.org; Mon, 16 Jan 2023 11:16:26 -0500
Received: by mail-yw1-x112a.google.com with SMTP id
 00721157ae682-4a263c4ddbaso387926917b3.0
 for <qemu-devel@nongnu.org>; Mon, 16 Jan 2023 08:16:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=2Y1GchaqMA5ZQi1Rlyhg/nTRNsCQowFFBVSPj4NCylY=;
 b=BjlY590Bi7GyRTNFzEVrDYHSC8XFsB3xv7h2b0B8YNd1Y8qLaDp9cVnlw0mPUgYcyW
 Gz+nypbk6mgsCC7aTSkNNNSJNYmc2YM6X71kLa9ytjG7tDXoSgCrYbV6cbgwisyu0fv9
 haMoU0zC3pbG5rglZ41b731F9wvJO3drH0QAzlyWm0DfTKqDLWnP4rdV+rlPb7T8B1m0
 O6Z5Sa1Aeubs9KitX25VpEd92VXObI4FxkiPppmGahTlap785YrF9EndKrQ3R6jptpQf
 ohrBGOVykEoCWeCSLwZp3iRkQLFa91jeO5j433sJOCD/XN2RRYTI11vcPPlTuJwNZ8s5
 ErCA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=2Y1GchaqMA5ZQi1Rlyhg/nTRNsCQowFFBVSPj4NCylY=;
 b=qwLq3yFy/b2yLD1F9a0CSw/S4nctdzK23htYK4YnVjtPJ3fjeKu3jowxAV6/u+ZMnI
 N4/yhSpzjC7IbFPZ2K21zjl8BO6SxT6hLsxOkYLytwNCkSNTTaUDP8ZRXPhutI3+cI8i
 Ai9wlexr+mDutI2VtCkKcUC6ywaK8P8zz2cU7jv3q3lHMTCgAGjesaAvSkJcf+HDFGN+
 mMh+HcAaRYaYTKZWHQc5tFZeqb9E/TGloHjg69YyiTL34j0Vikp7oH0X6vrnYnJfKWW4
 Mt0wWKlFjkWmwdrUM7+eFhbCg3/J9MnCFm2Aei6EO9Sb4hZt95ZYKI22k1abjZ9QzAAe
 DGYA==
X-Gm-Message-State: AFqh2kqLOG1FL+pfkOBQpeIKKeBtmnxbfkHl1GuP026o56nNtB4Gnp0r
 sfTHxyHfSYIgMT0jorI0SO3FfTxPjQWMnFm2G7Q=
X-Google-Smtp-Source: AMrXdXtqTmbKvIQF05VWLVmlJxyoTIcMf262cb/j8XzEB48FuzX9SsMMbY9nuHghBb81cA8Qhr3kf0jw1uV4DoDw0Bw=
X-Received: by 2002:a81:f0b:0:b0:473:4599:adba with SMTP id
 11-20020a810f0b000000b004734599adbamr3597014ywp.239.1673885781558; Mon, 16
 Jan 2023 08:16:21 -0800 (PST)
MIME-Version: 1.0
References: <63b89ae069d644b897ea97cc41b030ab@huawei.com>
In-Reply-To: <63b89ae069d644b897ea97cc41b030ab@huawei.com>
From: Stefan Hajnoczi <stefanha@gmail.com>
Date: Mon, 16 Jan 2023 11:16:09 -0500
Message-ID: <CAJSP0QVYUb2th_5Do_C6GjYYMzvCkyuta-04+wAdN5NVMGkPDw@mail.gmail.com>
Subject: Re: [QUESTION] About virtio and eventloop
To: zhukeqian <zhukeqian1@huawei.com>
Cc: "Michael S. Tsirkin" <mst@redhat.com>,
 Stefan Hajnoczi <stefanha@redhat.com>, 
 Peter Maydell <peter.maydell@linaro.org>,
 "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>, 
 "Wubin (H)" <wu.wubin@huawei.com>, "Chentao (Boby)" <boby.chen@huawei.com>, 
 "Wanghaibin (D)" <wanghaibin.wang@huawei.com>,
 "Zhangbo (Oscar)" <oscar.zhangbo@huawei.com>, 
 "limingwang (A)" <limingwang@huawei.com>, Wangyan <wangyan122@huawei.com>, 
 lihuachao <lihuachao1@huawei.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::112a;
 envelope-from=stefanha@gmail.com; helo=mail-yw1-x112a.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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

On Mon, 16 Jan 2023 at 03:20, zhukeqian via <qemu-devel@nongnu.org> wrote:
> And if IO operation is blocked, is vCPU thread will blocked when do deactivate?

Yes, blk_drain() is a synchronous function. It blocks until in-flight
I/O has finished. The vcpu thread will be blocked in
virtio_pci_common_write().

Stefan

