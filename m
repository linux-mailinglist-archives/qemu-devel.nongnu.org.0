Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 434F537259C
	for <lists+qemu-devel@lfdr.de>; Tue,  4 May 2021 07:47:26 +0200 (CEST)
Received: from localhost ([::1]:41728 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ldnu1-0002gv-CY
	for lists+qemu-devel@lfdr.de; Tue, 04 May 2021 01:47:25 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58940)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pankaj.gupta.linux@gmail.com>)
 id 1ldnqu-0001qa-0l; Tue, 04 May 2021 01:44:12 -0400
Received: from mail-il1-x12a.google.com ([2607:f8b0:4864:20::12a]:38882)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <pankaj.gupta.linux@gmail.com>)
 id 1ldnqq-0007i4-P4; Tue, 04 May 2021 01:44:11 -0400
Received: by mail-il1-x12a.google.com with SMTP id c3so5447257ils.5;
 Mon, 03 May 2021 22:44:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=G9ESRXefOvFcFU8JizCeiw+vMSlHN+RPYh9AjhBOqb8=;
 b=G5DClEfzuTVYVNRsJKfQJ2Q1QTCN37SlLVFqqvhciqDzHPQ8XnFr/N9dHmw9TTfN0E
 VggOshctvx5Zzn4ijwk+NXVBCytTblKaq5629URM4CAT21Wbb2K9q3OQm/ndSud7R3pE
 8cgnqNtHpaIC1YNScouwr2wZWkYcGdwQZSsGoF6WGwomhGjRvhMdi/9TicMzEkGUDxc6
 zJ8OI1WwyGfzkvfPkukevttNOdxFfQwLEtQXFuzGhjhm5GOeN4+Hy6JHPr6Y4VolxemC
 tHlCiWuXhyS3cTMq8rUTYfA5+F1p+otPe2Ke3gKn0kOznsDMJABwwOg5LUijFQ8jZu7y
 Lsxw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=G9ESRXefOvFcFU8JizCeiw+vMSlHN+RPYh9AjhBOqb8=;
 b=OQ3UGu1u85H7b0pxp1FXoU0Q8E+wji9kG3Gq3eTuJgvrnvvfTgF8f1tt0eFfTEfZ/6
 3YElvg4cKD6EEwMVD7nOR42VsZAC9DCQCb685/pgcLBN8YQBvzID/CxGOrY66sFRfMqL
 2c3J36tugvg90idSdtUY+eFRx9wWD2kG+Ypk4X+J3axggtpAIcq9Bfet3npIPJvgP7cu
 H3qxI88Ktgj6LzAYD+m7Gm/CkPnMoOpJkDUQ1vdtmQWR4AZveD6iIsmRD7ZqXcsxf7WV
 bUmZhkEe1Ynue/2mBtUAxoz4gKD4+67r+tAaLkv2bpCPYRa0NlPifDwhjyIehzOXjvBl
 sHDQ==
X-Gm-Message-State: AOAM533zXixc9JDlrgQxhhKSW0e2c2vYdRgKHgCYS2yWLcDxUn+AIpTp
 ySY2Qh+li196vgNBSZuvkqoEEhAq7EiFlk4ofe4=
X-Google-Smtp-Source: ABdhPJzC6alOzJqNjv57N04F4U3tHUEdbtp1zl/QgLQrapXHd+EvE5w35e9Iti1fnaIY0tTwULyBboMTw8lYepmsnxs=
X-Received: by 2002:a05:6e02:160d:: with SMTP id
 t13mr19821606ilu.85.1620107045748; 
 Mon, 03 May 2021 22:44:05 -0700 (PDT)
MIME-Version: 1.0
References: <161966810162.652.13723419108625443430.stgit@17be908f7c1c>
 <CAPcyv4gwkyDBG7EZOth-kcZR8Fb+RgGXY=Y9vbuHXAz3PAnLVw@mail.gmail.com>
 <bca3512d-5437-e8e6-68ae-0c9b887115f9@linux.ibm.com>
 <CAPcyv4hAOC89JOXr-ZCps=n8gEKD5W0jmGU1Enfo8ECVMf3veQ@mail.gmail.com>
 <d21fcac6-6a54-35fd-3088-6c56b85fbf25@linux.ibm.com>
In-Reply-To: <d21fcac6-6a54-35fd-3088-6c56b85fbf25@linux.ibm.com>
From: Pankaj Gupta <pankaj.gupta.linux@gmail.com>
Date: Tue, 4 May 2021 07:43:53 +0200
Message-ID: <CAM9Jb+g8bKF0Z7za4sZpc2tZ01Sp4c4FEaV65He8w1+QOL3_yw@mail.gmail.com>
Subject: Re: [PATCH v4 0/3] nvdimm: Enable sync-dax property for nvdimm
To: "Aneesh Kumar K.V" <aneesh.kumar@linux.ibm.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::12a;
 envelope-from=pankaj.gupta.linux@gmail.com; helo=mail-il1-x12a.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Shivaprasad G Bhat <sbhat@linux.ibm.com>,
 "Michael S. Tsirkin" <mst@redhat.com>, Qemu Developers <qemu-devel@nongnu.org>,
 linux-nvdimm <linux-nvdimm@lists.01.org>,
 Markus Armbruster <armbru@redhat.com>, bharata@linux.vnet.ibm.com,
 Haozhong Zhang <haozhong.zhang@intel.com>,
 Eduardo Habkost <ehabkost@redhat.com>, richard.henderson@linaro.org,
 Greg Kurz <groug@kaod.org>, kvm-ppc@vger.kernel.org, qemu-arm@nongnu.org,
 Stefan Hajnoczi <stefanha@redhat.com>, Igor Mammedov <imammedo@redhat.com>,
 Dan Williams <dan.j.williams@intel.com>, kwangwoo.lee@sk.com,
 David Gibson <david@gibson.dropbear.id.au>,
 Xiao Guangrong <xiaoguangrong.eric@gmail.com>,
 shameerali.kolothum.thodi@huawei.com, shivaprasadbhat@gmail.com,
 qemu-ppc@nongnu.org, Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

> > The proposal that "sync-dax=unsafe" for non-PPC architectures, is a
> > fundamental misrepresentation of how this is supposed to work. Rather
> > than make "sync-dax" a first class citizen of the device-description
> > interface I'm proposing that you make this a separate device-type.
> > This also solves the problem that "sync-dax" with an implicit
> > architecture backend assumption is not precise, but a new "non-nvdimm"
> > device type would make it explicit what the host is advertising to the
> > guest.
> >
>
> Currently, users can use a virtualized nvdimm support in Qemu to share
> host page cache to the guest via the below command
>
> -object memory-backend-file,id=memnvdimm1,mem-path=file_name_in_host_fs
> -device nvdimm,memdev=memnvdimm1
>
> Such usage can results in wrong application behavior because there is no
> hint to the application/guest OS that a cpu cache flush is not
> sufficient to ensure persistence.
>
> I understand that virio-pmem is suggested as an alternative for that.
> But why not fix virtualized nvdimm if platforms can express the details.
>
> ie, can ACPI indicate to the guest OS that the device need a flush
> mechanism to ensure persistence in the above case?
>
> What this patch series did was to express that property via a device
> tree node and guest driver enables a hypercall based flush mechanism to
> ensure persistence.

Would VIRTIO (entirely asynchronous, no trap at host side) based
mechanism is better
than hyper-call based? Registering memory can be done any way. We
implemented virtio-pmem
flush mechanisms with below considerations:

- Proper semantic for guest flush requests.
- Efficient mechanism for performance pov.

I am just asking myself if we have platform agnostic mechanism already
there, maybe
we can extend it to suit our needs? Maybe I am missing some points here.

> >> On PPC, the default is "sync-dax=writeback" - so the ND_REGION_ASYNC
> >>
> >> is set for the region and the guest makes hcalls to issue fsync on the host.
> >>
> >>
> >> Are you suggesting me to keep it "unsafe" as default for all architectures
> >>
> >> including PPC and a user can set it to "writeback" if desired.
> >
> > No, I am suggesting that "sync-dax" is insufficient to convey this
> > property. This behavior warrants its own device type, not an ambiguous
> > property of the memory-backend-file with implicit architecture
> > assumptions attached.
> >
>
> Why is it insufficient?  Is it because other architectures don't have an
> ability express this detail to guest OS? Isn't that an arch limitations?

