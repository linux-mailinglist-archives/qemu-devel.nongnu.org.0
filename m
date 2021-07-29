Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CF2183D9F32
	for <lists+qemu-devel@lfdr.de>; Thu, 29 Jul 2021 10:08:56 +0200 (CEST)
Received: from localhost ([::1]:45852 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m9167-0005sH-2Z
	for lists+qemu-devel@lfdr.de; Thu, 29 Jul 2021 04:08:55 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:56588)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imammedo@redhat.com>)
 id 1m9152-0004Ty-1e
 for qemu-devel@nongnu.org; Thu, 29 Jul 2021 04:07:48 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:31892)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imammedo@redhat.com>)
 id 1m9150-0005li-KG
 for qemu-devel@nongnu.org; Thu, 29 Jul 2021 04:07:47 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1627546065;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=2yoBfE5uJ+HTYThNci9pKULCsip8HqNoyhO1zHo8vlQ=;
 b=YBrjeGZXEPEGrXgFQMIMKNKtCeJYz/yvgWG+T2++Hf9rG8r9mhQaiGwy/p/n8bX1x8WgC0
 6gofzSGRWbn2n77TcYfhHsjcKQrQQzBXXGzihlFmPy+xqZ42aNFBO9JmdSviq5kBkCgul/
 qL1+0eAY4SISIb/54LaRcuV18LiG1AQ=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-462-kR2sW5UzN8-_Dyin68ONmQ-1; Thu, 29 Jul 2021 04:07:44 -0400
X-MC-Unique: kR2sW5UzN8-_Dyin68ONmQ-1
Received: by mail-wm1-f70.google.com with SMTP id
 132-20020a1c018a0000b029025005348905so1737599wmb.7
 for <qemu-devel@nongnu.org>; Thu, 29 Jul 2021 01:07:44 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=2yoBfE5uJ+HTYThNci9pKULCsip8HqNoyhO1zHo8vlQ=;
 b=Jym/G4oKbvz85LG+ChF2v0bB17QBBpRUHD1qwo/Eh7qdOtKZIJg7cQ/JuoOSadGXF2
 WrifuQmgY7ckCc8mwC2gLBr/4OS96Uv1xCJIp3zZ8Ijxu4/EfDyHzqQUrDuMTFvUCCOO
 JctsxFE26vqxBkzfunfoNcy9z2l+F1v9IwkI5gLjLX4nSQ2MlSR7GOu/swk5Xdh3HvR3
 OMnVszLPMt6kw8txQX8pr+okLGaYuFL+4OeKeEMFp+WZKNqGEehAophf3GK09MJo3vf/
 2PiEa8ohj6MRfodtss16ym7quJMkyfAmloZvkECf5f+gL+s+v9POpEne9f5V+tsToVGu
 tcig==
X-Gm-Message-State: AOAM531IzuUEqxEwe7DYGFBn0aE8XSxelnJ2vUQXvWOZnyrgnue0lCY9
 ysPLuX3tVI+SI3tdaMVhSKCRZrTu72dxxMeo7GwEgtuZ0N44eJ+aQM1iS16KuEmuH9BwUbAZb8p
 97VxrTIj/gX3PTSs=
X-Received: by 2002:a1c:4b0a:: with SMTP id y10mr3296130wma.111.1627546063253; 
 Thu, 29 Jul 2021 01:07:43 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyDhyRoFCjwMxusf3r5p855T7Lf8X0ibV3tU4K5FlBod7myDLEk4p7EZev6QyUfdbjnYVXeNw==
X-Received: by 2002:a1c:4b0a:: with SMTP id y10mr3296110wma.111.1627546063051; 
 Thu, 29 Jul 2021 01:07:43 -0700 (PDT)
Received: from localhost (nat-pool-brq-t.redhat.com. [213.175.37.10])
 by smtp.gmail.com with ESMTPSA id y6sm2237238wma.48.2021.07.29.01.07.42
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 29 Jul 2021 01:07:42 -0700 (PDT)
Date: Thu, 29 Jul 2021 10:07:41 +0200
From: Igor Mammedov <imammedo@redhat.com>
To: Eric DeVolder <eric.devolder@oracle.com>
Subject: Re: [PATCH v5 00/10] acpi: Error Record Serialization Table, ERST,
 support for QEMU
Message-ID: <20210729100741.75437344@redhat.com>
In-Reply-To: <fa873c6b-feaf-ea86-08f2-f27382632aae@oracle.com>
References: <1625080041-29010-1-git-send-email-eric.devolder@oracle.com>
 <20210720165751.52805aed@redhat.com>
 <20210727145518.2691c7c7@redhat.com>
 <fa873c6b-feaf-ea86-08f2-f27382632aae@oracle.com>
X-Mailer: Claws Mail 3.17.8 (GTK+ 2.24.33; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=imammedo@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=imammedo@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.719,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: ehabkost@redhat.com, mst@redhat.com, konrad.wilk@oracle.com,
 qemu-devel@nongnu.org, pbonzini@redhat.com, boris.ostrovsky@oracle.com,
 rth@twiddle.net
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Wed, 28 Jul 2021 10:19:51 -0500
Eric DeVolder <eric.devolder@oracle.com> wrote:

> On 7/27/21 7:55 AM, Igor Mammedov wrote:
> > PS:
> > If I haven't said it already, use checkpatch script before posting patches.
> >   
> 
> I do run checkpatch. On occasion I allow a warning about a line too long. And
> there is the MAINTAINERs message due to the new files. Is there something else
> that I'm missing?
> 

there were warnings about new line or something like this.


