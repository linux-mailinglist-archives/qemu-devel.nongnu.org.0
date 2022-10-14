Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 05EF05FF0E5
	for <lists+qemu-devel@lfdr.de>; Fri, 14 Oct 2022 17:12:28 +0200 (CEST)
Received: from localhost ([::1]:56740 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ojMMM-0000UQ-HF
	for lists+qemu-devel@lfdr.de; Fri, 14 Oct 2022 11:12:26 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34110)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1ojMHD-0003vE-EA
 for qemu-devel@nongnu.org; Fri, 14 Oct 2022 11:07:08 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:53078)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1ojMH4-0006TS-TY
 for qemu-devel@nongnu.org; Fri, 14 Oct 2022 11:07:06 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1665760015;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=eU29xFdyt6CC7CnrUOa2msH37xw/pr81WRV7TfUcJjg=;
 b=hWaxrXqJzDjJhfSRO5qWyTkX0DWsg15NAR5B4hhTXSJgIsjJTEPU/aQU0jWt3OT752fBxh
 g9Vkmw+9gB444d2gGFy9YbRpgPVAg2vrqUM+Bo1z4sUBDZ6MGzSVjud01NbNs/c7pyHylw
 AMg5KIAYzP0UR6bApNxhTm18OqlF5IY=
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com
 [209.85.222.198]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-660-jsvWDvBqOZGcCJDE69objw-1; Fri, 14 Oct 2022 11:06:54 -0400
X-MC-Unique: jsvWDvBqOZGcCJDE69objw-1
Received: by mail-qk1-f198.google.com with SMTP id
 u7-20020a05620a0c4700b006ee526183fcso3641137qki.8
 for <qemu-devel@nongnu.org>; Fri, 14 Oct 2022 08:06:54 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=eU29xFdyt6CC7CnrUOa2msH37xw/pr81WRV7TfUcJjg=;
 b=pMhfWZZpuYfF0g/W+YBtb/yXtBJ8I45oEHz3i0uqBfhyGi81RGAJi3ung90HJvjaw3
 g+5/+bHta+WAEhGQeYrbHg0NYZhB4ZOjR1oEVmWf783V8xD3u66a6DZWtzso4a2Zc8kp
 YorbneQD4gN53HvZzUz2QxkI6YQLIhYq5ee//NwqhdpUaO4lFmOS0qMEirSKJ2Oa1MBb
 PrwUDixUSF7S6dr9zNJvqy7N0LBdzBemWn+K6XBg7q6vFBA9jgM9O/b1h2neRhJ2WanK
 f1qlfdaBJXVUQXIkFLVTiR5pprAlnHIyQ/YwKk+T+8sP5EcmCNnLnMk2RikEL0b63QN7
 6rSQ==
X-Gm-Message-State: ACrzQf1Bv3mnWqC7bX2LPOWkuaBV8pgPT+sWyMqA5nUj5Q9XYCBhn83a
 d2Akyx3tzOxd9d8/2+1UB8DYUsecl5uMznvZuoJSWQdo2Ym3cpd0knxLVqIqTvYQyhkQpcyvpLD
 7vDhlxOBWA4cEeLo=
X-Received: by 2002:ac8:4e52:0:b0:39c:bb5a:33e5 with SMTP id
 e18-20020ac84e52000000b0039cbb5a33e5mr4549903qtw.653.1665760013435; 
 Fri, 14 Oct 2022 08:06:53 -0700 (PDT)
X-Google-Smtp-Source: AMsMyM5cHBpPL1GmCH5fxWpThhSX1OrPqphnTeQ1n9uVAgd4HQErdLGMqa3FzY6gTfGL5H6s4AnKVA==
X-Received: by 2002:ac8:4e52:0:b0:39c:bb5a:33e5 with SMTP id
 e18-20020ac84e52000000b0039cbb5a33e5mr4549876qtw.653.1665760013204; 
 Fri, 14 Oct 2022 08:06:53 -0700 (PDT)
Received: from x1n (bras-base-aurron9127w-grc-46-70-31-27-79.dsl.bell.ca.
 [70.31.27.79]) by smtp.gmail.com with ESMTPSA id
 bk10-20020a05620a1a0a00b006eeaf9160d6sm2554181qkb.24.2022.10.14.08.06.52
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 14 Oct 2022 08:06:52 -0700 (PDT)
Date: Fri, 14 Oct 2022 11:06:51 -0400
From: Peter Xu <peterx@redhat.com>
To: Jason Wang <jasowang@redhat.com>
Cc: mst@redhat.com, qemu-devel@nongnu.org, yi.l.liu@intel.com,
 yi.y.sun@linux.intel.com
Subject: Re: [PATCH V3 3/4] intel-iommu: convert VTD_PE_GET_FPD_ERR() to be a
 function
Message-ID: <Y0l7C18bYto4UdEw@x1n>
References: <20221009054835.1540-1-jasowang@redhat.com>
 <20221009054835.1540-4-jasowang@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20221009054835.1540-4-jasowang@redhat.com>
Received-SPF: pass client-ip=170.10.133.124; envelope-from=peterx@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Sun, Oct 09, 2022 at 01:48:34PM +0800, Jason Wang wrote:
> We used to have a macro for VTD_PE_GET_FPD_ERR() but it has an
> internal goto which prevents it from being reused. This patch convert
> that macro to a dedicated function and let the caller to decide what
> to do (e.g using goto or not). This makes sure it can be re-used for
> other function that requires fault reporting.
> 
> Signed-off-by: Jason Wang <jasowang@redhat.com>
> ---

Reviewed-by: Peter Xu <peterx@redhat.com>

-- 
Peter Xu


