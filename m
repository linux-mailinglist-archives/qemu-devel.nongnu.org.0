Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4F6B716C30
	for <lists+qemu-devel@lfdr.de>; Tue,  7 May 2019 22:27:07 +0200 (CEST)
Received: from localhost ([127.0.0.1]:54063 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1hO6g6-0001wH-8I
	for lists+qemu-devel@lfdr.de; Tue, 07 May 2019 16:27:06 -0400
Received: from eggs.gnu.org ([209.51.188.92]:57753)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <jstaron@google.com>) id 1hO6f7-0001cI-OR
	for qemu-devel@nongnu.org; Tue, 07 May 2019 16:26:06 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <jstaron@google.com>) id 1hO6f4-0006Cj-JT
	for qemu-devel@nongnu.org; Tue, 07 May 2019 16:26:04 -0400
Received: from mail-pf1-x442.google.com ([2607:f8b0:4864:20::442]:35712)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <jstaron@google.com>) id 1hO6f2-0006B4-55
	for qemu-devel@nongnu.org; Tue, 07 May 2019 16:26:00 -0400
Received: by mail-pf1-x442.google.com with SMTP id t87so8664789pfa.2
	for <qemu-devel@nongnu.org>; Tue, 07 May 2019 13:25:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
	h=subject:to:cc:references:from:message-id:date:user-agent
	:mime-version:in-reply-to:content-language:content-transfer-encoding;
	bh=SDTbfUna34Qd79ay/PvHpXeLqKHYqAqzFBtMK1XzxGI=;
	b=ON/NQjQWEi3fON/DDBAYu5HG4F3A9wQYYX3ZHXewW6rdfpyfN6GDeKnlxgf9/si9a9
	9JHSodUWXjDvUXWyvoEwEE0DgwhDeKMop/6LDrDPkGLUCYR03QkkfX5S7JFJ8pfilSDZ
	xvvi21rJRzAsyyhE+/kT6jH7WSjJD4+uklULukm2H+Pokk9wj1CJ1/NtVElLjBkK6KcS
	JqikN21lQ/W3kOqZE29va5iKvC/1zmXoxZvy0PuN6Nh+lQFN6TTKu80Ldt+bYozlFh95
	K/LSeCc2Mr0qC2NpnPv30EkDStUnE9M9IgeET/tA/SjNLgtMCQoX8YEn/nGCjEfLlQaU
	jpyQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:to:cc:references:from:message-id:date
	:user-agent:mime-version:in-reply-to:content-language
	:content-transfer-encoding;
	bh=SDTbfUna34Qd79ay/PvHpXeLqKHYqAqzFBtMK1XzxGI=;
	b=AHjDBudU5LwQRKv5Gpba6GklPawkcIswLDlx3HjFKcvMEoLzr9oWvfUgRna+bYescV
	2FN69XxFx3pF+k3NBhB8bpMzNg7kcSpFl08cV9C/aPRLp9eVn4lFIU51QKA5AUXiWEFl
	iFAZhPMdKidsvc4hkDd/Fc/in+QXpPhC1mZ332fkuGhYXRYsAQnM+8JEscRWsckx6Bt4
	xqHP853WENYFS/2qSW4PPqzGNOJW02HJYvQh4Egd0I3CiXuyxcoUIVKedz0l5pG2wYT+
	t3lov2xsJsQXA1QXM+mEqU1EL5OzAhS2kBZg7J8tB9Ny9AmvFLvkKhzWN+I2wdB2RHOb
	3WoA==
X-Gm-Message-State: APjAAAVFXHHTUsBqBPmqr5o2Tr3V0fRR8VN+UlzKleKSjLBm947w+cqs
	bUenq+KK/o+/AqYn7jE9R21XAA==
X-Google-Smtp-Source: APXvYqxbPfJ5tBulG/r6tvcVjjtvKQlgkwdEbMW3aGkGHvRkjNKPxepulcAi/TILththSdbF+vLDMw==
X-Received: by 2002:aa7:8dc3:: with SMTP id j3mr43498542pfr.141.1557260757236; 
	Tue, 07 May 2019 13:25:57 -0700 (PDT)
Received: from jstaron2.mtv.corp.google.com
	([2620:15c:202:201:b94f:2527:c39f:ca2d])
	by smtp.gmail.com with ESMTPSA id
	f5sm15855223pgo.75.2019.05.07.13.25.55
	(version=TLS1_3 cipher=AEAD-AES128-GCM-SHA256 bits=128/128);
	Tue, 07 May 2019 13:25:56 -0700 (PDT)
To: Pankaj Gupta <pagupta@redhat.com>, linux-nvdimm@lists.01.org,
	linux-kernel@vger.kernel.org, virtualization@lists.linux-foundation.org,
	kvm@vger.kernel.org, linux-fsdevel@vger.kernel.org,
	linux-acpi@vger.kernel.org, qemu-devel@nongnu.org,
	linux-ext4@vger.kernel.org, linux-xfs@vger.kernel.org
References: <20190426050039.17460-1-pagupta@redhat.com>
	<20190426050039.17460-3-pagupta@redhat.com>
Message-ID: <3d6479ae-6c39-d614-f1d9-aa1978e2e438@google.com>
Date: Tue, 7 May 2019 13:25:54 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
	Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <20190426050039.17460-3-pagupta@redhat.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:4864:20::442
Subject: Re: [Qemu-devel] [PATCH v7 2/6] virtio-pmem: Add virtio pmem driver
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-devel/>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=subscribe>
From: =?UTF-8?Q?Jakub_Staro=c5=84?= via Qemu-devel <qemu-devel@nongnu.org>
Reply-To: =?UTF-8?Q?Jakub_Staro=c5=84?= <jstaron@google.com>
Cc: jack@suse.cz, mst@redhat.com, jasowang@redhat.com, david@fromorbit.com,
	lcapitulino@redhat.com, adilger.kernel@dilger.ca,
	smbarber@google.com, zwisler@kernel.org, aarcange@redhat.com,
	dave.jiang@intel.com, darrick.wong@oracle.com,
	vishal.l.verma@intel.com, david@redhat.com, willy@infradead.org,
	hch@infradead.org, jmoyer@redhat.com, nilal@redhat.com,
	lenb@kernel.org, kilobyte@angband.pl, riel@surriel.com,
	yuval.shaia@oracle.com, stefanha@redhat.com, imammedo@redhat.com,
	dan.j.williams@intel.com, kwolf@redhat.com, tytso@mit.edu,
	xiaoguangrong.eric@gmail.com, cohuck@redhat.com,
	rjw@rjwysocki.net, pbonzini@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 4/25/19 10:00 PM, Pankaj Gupta wrote:

> +void host_ack(struct virtqueue *vq)
> +{
> +	unsigned int len;
> +	unsigned long flags;
> +	struct virtio_pmem_request *req, *req_buf;
> +	struct virtio_pmem *vpmem = vq->vdev->priv;
> +
> +	spin_lock_irqsave(&vpmem->pmem_lock, flags);
> +	while ((req = virtqueue_get_buf(vq, &len)) != NULL) {
> +		req->done = true;
> +		wake_up(&req->host_acked);
> +
> +		if (!list_empty(&vpmem->req_list)) {
> +			req_buf = list_first_entry(&vpmem->req_list,
> +					struct virtio_pmem_request, list);
> +			list_del(&vpmem->req_list);

Shouldn't it be rather `list_del(vpmem->req_list.next)`? We are trying to unlink
first element of the list and `vpmem->req_list` is just the list head.

> +int virtio_pmem_flush(struct nd_region *nd_region)
> +{
> +	int err;
> +	unsigned long flags;
> +	struct scatterlist *sgs[2], sg, ret;
> +	struct virtio_device *vdev = nd_region->provider_data;
> +	struct virtio_pmem *vpmem = vdev->priv;
> +	struct virtio_pmem_request *req;
> +
> +	might_sleep();
> +	req = kmalloc(sizeof(*req), GFP_KERNEL);
> +	if (!req)
> +		return -ENOMEM;
> +
> +	req->done = req->wq_buf_avail = false;
> +	strcpy(req->name, "FLUSH");
> +	init_waitqueue_head(&req->host_acked);
> +	init_waitqueue_head(&req->wq_buf);
> +	sg_init_one(&sg, req->name, strlen(req->name));
> +	sgs[0] = &sg;
> +	sg_init_one(&ret, &req->ret, sizeof(req->ret));
> +	sgs[1] = &ret;
> +
> +	spin_lock_irqsave(&vpmem->pmem_lock, flags);
> +	err = virtqueue_add_sgs(vpmem->req_vq, sgs, 1, 1, req, GFP_ATOMIC);
> +	if (err) {
> +		dev_err(&vdev->dev, "failed to send command to virtio pmem device\n");
> +
> +		list_add_tail(&vpmem->req_list, &req->list);
> +		spin_unlock_irqrestore(&vpmem->pmem_lock, flags);
> +
> +		/* When host has read buffer, this completes via host_ack */
> +		wait_event(req->wq_buf, req->wq_buf_avail);
> +		spin_lock_irqsave(&vpmem->pmem_lock, flags);
> +	}

Aren't the arguments in `list_add_tail` swapped? The element we are adding should
be first, the list should be second. Also, shouldn't we resubmit the request after
waking up from `wait_event(req->wq_buf, req->wq_buf_avail)`?

I propose rewriting it like that:

diff --git a/drivers/nvdimm/virtio_pmem.c b/drivers/nvdimm/virtio_pmem.c
index 66b582f751a3..ff0556b04e86 100644
--- a/drivers/nvdimm/virtio_pmem.c
+++ b/drivers/nvdimm/virtio_pmem.c
@@ -25,7 +25,7 @@ void host_ack(struct virtqueue *vq)
 		if (!list_empty(&vpmem->req_list)) {
 			req_buf = list_first_entry(&vpmem->req_list,
 					struct virtio_pmem_request, list);
-			list_del(&vpmem->req_list);
+			list_del(vpmem->req_list.next);
 			req_buf->wq_buf_avail = true;
 			wake_up(&req_buf->wq_buf);
 		}
@@ -59,17 +59,33 @@ int virtio_pmem_flush(struct nd_region *nd_region)
 	sgs[1] = &ret;
 
 	spin_lock_irqsave(&vpmem->pmem_lock, flags);
-	err = virtqueue_add_sgs(vpmem->req_vq, sgs, 1, 1, req, GFP_ATOMIC);
-	if (err) {
-		dev_err(&vdev->dev, "failed to send command to virtio pmem device\n");
+	/*
+	 * If virtqueue_add_sgs returns -ENOSPC then req_vq virtual queue does not
+	 * have free descriptor slots. We add the request to req_list and wait
+	 * for host_ack to wake us up when free slots are available.
+	 */
+	while ((err = virtqueue_add_sgs(vpmem->req_vq, sgs, 1, 1, req, GFP_ATOMIC)) == -ENOSPC) {
+		dev_err(&vdev->dev, "failed to send command to virtio pmem device, no free slots in the virtqueue, postponing request\n");
+		req->wq_buf_avail = false;
 
-		list_add_tail(&vpmem->req_list, &req->list);
+		list_add_tail(&req->list, &vpmem->req_list);
 		spin_unlock_irqrestore(&vpmem->pmem_lock, flags);
 
 		/* When host has read buffer, this completes via host_ack */
 		wait_event(req->wq_buf, req->wq_buf_avail);
 		spin_lock_irqsave(&vpmem->pmem_lock, flags);
 	}
+
+	/*
+	 * virtqueue_add_sgs failed with error different than -ENOSPC, we can't
+	 * do anything about that.
+	 */
+	if (err) {
+		dev_info(&vdev->dev, "failed to send command to virtio pmem device, error code %d\n", err);
+		spin_unlock_irqrestore(&vpmem->pmem_lock, flags);
+		err = -EIO;
+		goto ret;
+	}
 	err = virtqueue_kick(vpmem->req_vq);
 	spin_unlock_irqrestore(&vpmem->pmem_lock, flags);


Let me know if it looks reasonable to you.

Thank you,
Jakub Staron


