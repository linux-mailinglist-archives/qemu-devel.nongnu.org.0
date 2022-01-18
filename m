Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6ED914913B9
	for <lists+qemu-devel@lfdr.de>; Tue, 18 Jan 2022 02:42:24 +0100 (CET)
Received: from localhost ([::1]:58298 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n9dVu-0006fd-VT
	for lists+qemu-devel@lfdr.de; Mon, 17 Jan 2022 20:42:22 -0500
Received: from eggs.gnu.org ([209.51.188.92]:49458)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1n9dSj-000541-2q
 for qemu-devel@nongnu.org; Mon, 17 Jan 2022 20:39:05 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:58000)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1n9dSf-0006Ra-TG
 for qemu-devel@nongnu.org; Mon, 17 Jan 2022 20:39:03 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1642469940;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=ESEC45lg+bEAqkpqEjD7UiEpyuxrC33lIbWYExDCJKM=;
 b=PLr9jhmGCZMaiwKT4HRPjk03vzvDbYsnCyjyHBt0XnzePbq7iVlhEQKUj/Kifm+kJH1qQH
 PG7PUnkpAC3g1DC0H/SPgO+zhG2zC7H121Ay0ys7zU8DPs4J5e0uNgikyMYdDfM8ofEwlV
 SDbkXpGNPYtGsv3EF/XcXgRRgd0oBQA=
Received: from mail-pf1-f199.google.com (mail-pf1-f199.google.com
 [209.85.210.199]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-671-alJcE-JXPcuVvCrjl5g6cw-1; Mon, 17 Jan 2022 20:38:59 -0500
X-MC-Unique: alJcE-JXPcuVvCrjl5g6cw-1
Received: by mail-pf1-f199.google.com with SMTP id
 h196-20020a6283cd000000b004bed33745c9so7165500pfe.23
 for <qemu-devel@nongnu.org>; Mon, 17 Jan 2022 17:38:59 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to;
 bh=ESEC45lg+bEAqkpqEjD7UiEpyuxrC33lIbWYExDCJKM=;
 b=GO8lfndNx1PEsbJq74TB9wtaZAXfx1fp3AdAvplS8FgXLlJqgGp8lb58NjdHPnSxbm
 cReFP2JqnRRSU7EopspueofG7MzF+s1cByqhJZnPPFIlcBi8I3QZC76meLo4xx2Paqy4
 B4QMyzxyQ/067ZmnOFtlLa0o1gr0+AAPvqY2gX5Jk76qziy+UlyI0zJp1aJjVAF0FCvv
 wblkHtb4yHRHhYtjeLgc7Ul+P43tXYE3W3XFrcZxWU5QTHgu8IkrR16/Te7e8RQud55K
 0FCdDuFzrMBPYoid/dzzagTeOS6frLtpdOmTYZJ9j0Ad36ngDjwbwNSpyafYy1V+9Huw
 4qqw==
X-Gm-Message-State: AOAM533TM/uheTNEmsd/DmHExePe7ID2b0ZkXCeFSh0A/M1cZJmiGMgk
 4edWcMjki7ZVn4ChBsUxbg608+H1ZNAFOp3+Q9T1k7N0r+Ean+7e4tbBCUiwSHZFcV1Vo22hobh
 7PD4+wap7wCO486c=
X-Received: by 2002:a17:90a:2e09:: with SMTP id
 q9mr26865337pjd.2.1642469937783; 
 Mon, 17 Jan 2022 17:38:57 -0800 (PST)
X-Google-Smtp-Source: ABdhPJw+MCPGtXBOhFZkZGaONNfmNh0yZOKHELZFqaJBGHpfyocTru5XNWcJvA0HvKhBh5r/9d3rzQ==
X-Received: by 2002:a17:90a:2e09:: with SMTP id
 q9mr26865314pjd.2.1642469937466; 
 Mon, 17 Jan 2022 17:38:57 -0800 (PST)
Received: from xz-m1.local ([191.101.132.55])
 by smtp.gmail.com with ESMTPSA id x185sm2841750pfd.58.2022.01.17.17.38.53
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 17 Jan 2022 17:38:56 -0800 (PST)
Date: Tue, 18 Jan 2022 09:38:51 +0800
From: Peter Xu <peterx@redhat.com>
To: Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Subject: Re: [PATCH v3] hw/dma: Let dma_buf_read() / dma_buf_write()
 propagate MemTxResult
Message-ID: <YeYaK8Aqu08DjYJv@xz-m1.local>
References: <20220117125130.131828-1-f4bug@amsat.org>
MIME-Version: 1.0
In-Reply-To: <20220117125130.131828-1-f4bug@amsat.org>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=peterx@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=peterx@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.699,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: qemu-block@nongnu.org, David Hildenbrand <david@redhat.com>,
 Klaus Jensen <k.jensen@samsung.com>, qemu-devel@nongnu.org,
 Klaus Jensen <its@irrelevant.dk>, Paolo Bonzini <pbonzini@redhat.com>,
 Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Mon, Jan 17, 2022 at 01:51:30PM +0100, Philippe Mathieu-Daudé wrote:
> From: Philippe Mathieu-Daudé <philmd@redhat.com>
> 
> Since commit 292e13142d2, dma_buf_rw() returns a MemTxResult type.
> Do not discard it, return it to the caller. Pass the previously
> returned value (the QEMUSGList residual size, which was rarely used)
> as an optional argument.
> 
> With this new API, SCSIRequest::residual might now be accessed via
> a pointer. Since the size_t type does not have the same size on
> 32 and 64-bit host architectures, convert it to a uint64_t, which
> is big enough to hold the residual size, and the type is constant
> on both 32/64-bit hosts.
> 
> Update the few dma_buf_read() / dma_buf_write() callers to the new
> API.
> 
> Reviewed-by: Klaus Jensen <k.jensen@samsung.com>
> Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
> Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>

Acked-by: Peter Xu <peterx@redhat.com>

-- 
Peter Xu


