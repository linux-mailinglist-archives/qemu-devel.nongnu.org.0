Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id ABDA95FF0D2
	for <lists+qemu-devel@lfdr.de>; Fri, 14 Oct 2022 17:11:19 +0200 (CEST)
Received: from localhost ([::1]:55388 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ojMLF-0007X6-Sj
	for lists+qemu-devel@lfdr.de; Fri, 14 Oct 2022 11:11:17 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33632)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1ojMFc-0002hg-2D
 for qemu-devel@nongnu.org; Fri, 14 Oct 2022 11:05:28 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:48960)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1ojMFZ-0006F1-C1
 for qemu-devel@nongnu.org; Fri, 14 Oct 2022 11:05:26 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1665759924;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=NN9oivWCbrZYnbkDIwyxrFBIxbpU/foO/yGZOpFPULk=;
 b=XF3L1s6CMVZgpank4fhazEG/m4LFajGe04YlB0yOe6QpmAVu/mnEZa7QRKl0V5ywVmKgtR
 LTxVTaCtqK0Um2syPk4/i+/+LUm8GuT0aETFpUAlr7Hne56mB1/7O7iD+LLvCsa2+FY4ar
 3Yzx5tt6Bj56w3KLftKK+f3w4BDT5c8=
Received: from mail-qv1-f69.google.com (mail-qv1-f69.google.com
 [209.85.219.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-52-XSoQ21zIP7irmaOi043nMA-1; Fri, 14 Oct 2022 11:05:22 -0400
X-MC-Unique: XSoQ21zIP7irmaOi043nMA-1
Received: by mail-qv1-f69.google.com with SMTP id
 ok8-20020a0562143c8800b004b07e9ca57eso3626646qvb.19
 for <qemu-devel@nongnu.org>; Fri, 14 Oct 2022 08:05:22 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=NN9oivWCbrZYnbkDIwyxrFBIxbpU/foO/yGZOpFPULk=;
 b=n8XEItbzLPmfZMkNEFc9C3Wny+Z0PQBPQyyk3PE3F/ZfUos1b7DKDioRpdDhP/rb2u
 MmuPbY7g6qHmrtwHk9gPouk0YGf9dopnVqgDMjeCRLvCASHeO+n4l9q2IWlwS38ClOu1
 hQghzmcVDRNTv3JD2iyOD6ImnIdXWHGSeiLK/ybaxYqi7ihzzRaj4btV2XKuDCiFlVX+
 pzJ2j82LX8PIiNUxJiTlLH4XRzLzK7vw7HPXLERggIBgS8zBB8ZwL0rNNM36fqcy8cJf
 eQqTLT7hwzeTmfO34MQFv3Q5VewEpouzyDtpx8cvroLM1CfyYfU7/rU6Te7XNxojDsgd
 C7iA==
X-Gm-Message-State: ACrzQf3s3r4g1MGUvVTd9AjzHEYRlrOg8vplmOFKqqO1bjHEI4QN+2he
 R8Dt8CRxgs3XZvqk/7nGB1FP1CsKY1Ub7+AsidWgCqK4YpK7RFkadVjDIASz6czQc1aAjtYkVfp
 wvFnlkk8Yo4xHAFc=
X-Received: by 2002:a05:622a:446:b0:39c:d995:4548 with SMTP id
 o6-20020a05622a044600b0039cd9954548mr2151999qtx.59.1665759922151; 
 Fri, 14 Oct 2022 08:05:22 -0700 (PDT)
X-Google-Smtp-Source: AMsMyM6X9OZ7792VLJDX80tNTrixdiSuVaYVXEFcSbxTvY3+tWG9Fh+toC2Rq8rHezWZTwWefYjk1w==
X-Received: by 2002:a05:622a:446:b0:39c:d995:4548 with SMTP id
 o6-20020a05622a044600b0039cd9954548mr2151971qtx.59.1665759921911; 
 Fri, 14 Oct 2022 08:05:21 -0700 (PDT)
Received: from x1n (bras-base-aurron9127w-grc-46-70-31-27-79.dsl.bell.ca.
 [70.31.27.79]) by smtp.gmail.com with ESMTPSA id
 g10-20020ac8070a000000b0039cc47752casm2115643qth.77.2022.10.14.08.05.20
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 14 Oct 2022 08:05:21 -0700 (PDT)
Date: Fri, 14 Oct 2022 11:05:20 -0400
From: Peter Xu <peterx@redhat.com>
To: Jason Wang <jasowang@redhat.com>
Cc: mst@redhat.com, qemu-devel@nongnu.org, yi.l.liu@intel.com,
 yi.y.sun@linux.intel.com
Subject: Re: [PATCH V3 1/4] intel-iommu: don't warn guest errors when getting
 rid2pasid entry
Message-ID: <Y0l6sJD4oJrpgSIG@x1n>
References: <20221009054835.1540-1-jasowang@redhat.com>
 <20221009054835.1540-2-jasowang@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20221009054835.1540-2-jasowang@redhat.com>
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

On Sun, Oct 09, 2022 at 01:48:32PM +0800, Jason Wang wrote:
> We use to warn on wrong rid2pasid entry. But this error could be
> triggered by the guest and could happens during initialization. So
> let's don't warn in this case.
> 
> Signed-off-by: Jason Wang <jasowang@redhat.com>

Reviewed-by: Peter Xu <peterx@redhat.com>

-- 
Peter Xu


