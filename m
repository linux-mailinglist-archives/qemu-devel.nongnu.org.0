Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D25E15664B3
	for <lists+qemu-devel@lfdr.de>; Tue,  5 Jul 2022 10:07:59 +0200 (CEST)
Received: from localhost ([::1]:53578 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o8dbC-0000Ik-GY
	for lists+qemu-devel@lfdr.de; Tue, 05 Jul 2022 04:07:58 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60028)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgilbert@redhat.com>)
 id 1o8dXY-0005im-Ax
 for qemu-devel@nongnu.org; Tue, 05 Jul 2022 04:04:13 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:36665)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgilbert@redhat.com>)
 id 1o8dXR-0007qB-Fk
 for qemu-devel@nongnu.org; Tue, 05 Jul 2022 04:04:09 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1657008244;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=yib1saaRzo0ns7txxSM+GJJI1jLb7eIFh1Yy1MP0R8s=;
 b=TQ1le8PXgKiw6K/e/fOjZr70zti3zEfW2bHXg8pk7kpkx2pO7IRpoVpqrV7QsxhCXPoUtg
 PVG5PNCIo3uZgQJwSyPQmSWtdPBsEtoM9SbE0ItiO79FdWmSlZTicGX9W3Mk/udlCGhfKK
 AdgX7PNm/I0qsRrhjJP3c/Ahdw4v+p8=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-645-tHW50QcfOLWAM8gLaTYxKg-1; Tue, 05 Jul 2022 04:04:02 -0400
X-MC-Unique: tHW50QcfOLWAM8gLaTYxKg-1
Received: by mail-wr1-f69.google.com with SMTP id
 l11-20020adfbd8b000000b0021d754b84c5so153091wrh.17
 for <qemu-devel@nongnu.org>; Tue, 05 Jul 2022 01:04:01 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to:user-agent;
 bh=yib1saaRzo0ns7txxSM+GJJI1jLb7eIFh1Yy1MP0R8s=;
 b=bZrd6y+J85Zh6iFh6Q8wURhXPx69K1TIBg14H0XT9kpvbF6QZdZHY1WhKqzJ1k+e98
 D48uHA03fJvEH1rQDT6wbLMAAT8SZ/KVLREemElGlIYm6i1wTjTa151fc4BD/8mL2TgF
 6jjOYZ4LhCUIpAVE4rRERVVCBnf0YJb8aYiy4jDmOQ5ZAYI5iP1VEjCRiuHuWvCyS6x7
 QLP5NtdVNpL2Zzkb4LRVr3zwu3jmRD0QnLCK0WY2Btj/V10n2Cok6hQxUQ2FVQt+m9Np
 eMsNsOH6oFd2aGyQJKwnW0BHa9bzOnorfO3rjAPZQ/A8U/3+orELXLD65oswPUywUXEp
 ibnA==
X-Gm-Message-State: AJIora/lmkCS7JV2Xk1RLjV6yRnfmXycU1ASqEZf8aO+VD7EgbEhScQj
 5HOUVLsLsJYMLjUdwuBG6A2uebLie+B/I0ZzGUSXSE5lmhNQl8ZdgXTjWuR+zxDIoxA1xrFD51D
 /UAxsqO/7yS5FE8k=
X-Received: by 2002:a7b:c4cb:0:b0:3a2:b45a:e344 with SMTP id
 g11-20020a7bc4cb000000b003a2b45ae344mr6499666wmk.157.1657008240743; 
 Tue, 05 Jul 2022 01:04:00 -0700 (PDT)
X-Google-Smtp-Source: AGRyM1tHC6KnhFbzCfbhaROd9mfPyPZAFG4fNgQj7NgEl5WS7Aasi0fsVG+Wa4jyMJVs85ZQc0VSGg==
X-Received: by 2002:a7b:c4cb:0:b0:3a2:b45a:e344 with SMTP id
 g11-20020a7bc4cb000000b003a2b45ae344mr6499642wmk.157.1657008240453; 
 Tue, 05 Jul 2022 01:04:00 -0700 (PDT)
Received: from work-vm (cpc109025-salf6-2-0-cust480.10-2.cable.virginm.net.
 [82.30.61.225]) by smtp.gmail.com with ESMTPSA id
 g1-20020adffc81000000b00213ba3384aesm33132757wrr.35.2022.07.05.01.03.59
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 05 Jul 2022 01:03:59 -0700 (PDT)
Date: Tue, 5 Jul 2022 09:03:57 +0100
From: "Dr. David Alan Gilbert" <dgilbert@redhat.com>
To: Thomas Huth <thuth@redhat.com>
Cc: "Zhao, Shirley" <shirley.zhao@intel.com>,
 "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>,
 virtio-fs@redhat.com, Stefan Hajnoczi <stefanha@redhat.com>
Subject: Re: [Qemu] how to use viriofs in qemu without NUMA
Message-ID: <YsPwbbiuxtkD6HSp@work-vm>
References: <BY5PR11MB42911D5BF55D9FAF501F64F68D819@BY5PR11MB4291.namprd11.prod.outlook.com>
 <3b6c8e16-3712-3402-3ab2-17bf53ec64a8@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <3b6c8e16-3712-3402-3ab2-17bf53ec64a8@redhat.com>
User-Agent: Mutt/2.2.6 (2022-06-05)
Received-SPF: pass client-ip=170.10.129.124; envelope-from=dgilbert@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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

* Thomas Huth (thuth@redhat.com) wrote:
> On 05/07/2022 03.02, Zhao, Shirley wrote:
> > Hi, all,
> > 
> > I want to use virtiofs to share folder between host and guest.
> > 
> >  From the guide, it must set the NUMA node.
> > https://virtio-fs.gitlab.io/howto-qemu.html
> > 
> > But my guest doesn’t support NUMA.
> > 
> > Is there any guide to use qemu + virtiofs without NUMA?
> > 
> > Or does qemu have any plan to support it?
> 
>  Hi!
> 
> At least on s390x, you can also specify the memory backend via the -machine
> option instead of using the -numa option, e.g.:
> 
>  qemu-system-s390x -machine memory-backend=mem \
>   -object memory-backend-file,id=mem,...
> 
> Not sure whether that works on other architectures, too, though. Stefan,
> David, do you know?

Right, that's the way I do it on x86.
We wrote virtiofs before the memory-backend option existed, which is why
the old docs talk about using the NUMA stuff.

Dave

>  Thomas
> 
-- 
Dr. David Alan Gilbert / dgilbert@redhat.com / Manchester, UK


