Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C29184C0DA5
	for <lists+qemu-devel@lfdr.de>; Wed, 23 Feb 2022 08:53:30 +0100 (CET)
Received: from localhost ([::1]:46120 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nMmSn-0005vZ-OK
	for lists+qemu-devel@lfdr.de; Wed, 23 Feb 2022 02:53:29 -0500
Received: from eggs.gnu.org ([209.51.188.92]:60444)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1nMmQ1-00057n-BC
 for qemu-devel@nongnu.org; Wed, 23 Feb 2022 02:50:39 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:50041)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1nMmPw-0006hS-EV
 for qemu-devel@nongnu.org; Wed, 23 Feb 2022 02:50:35 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1645602631;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=rmIKVUXY6Ex7Fr+Hzz+S2tHYd6oxZVxFZ9OJ/MY0RLs=;
 b=HnOzfNmIMIjt/27irfuLZ+QcS+Jj81qbJrj276J98GcY63EYKz93Dks4ZY4LLt4lAMNpat
 AjNZhxIGsOPXucZDQrRVkiI7UvW5n4DHRAm2lwT9ijAGChmy1Zq+i7LJvXo8SRhUAcmclV
 XvGCrwD3AsnXKTHzIms5Bhz3P2RiYvQ=
Received: from mail-pf1-f200.google.com (mail-pf1-f200.google.com
 [209.85.210.200]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-156-p1LpQTiAM9Kw7bgSFI9PnA-1; Wed, 23 Feb 2022 02:50:30 -0500
X-MC-Unique: p1LpQTiAM9Kw7bgSFI9PnA-1
Received: by mail-pf1-f200.google.com with SMTP id
 a22-20020aa79716000000b004e16e3cc5fcso8590045pfg.11
 for <qemu-devel@nongnu.org>; Tue, 22 Feb 2022 23:50:30 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=rmIKVUXY6Ex7Fr+Hzz+S2tHYd6oxZVxFZ9OJ/MY0RLs=;
 b=UhGw2lotiY0sZTLyrwPTdN5cHI4j84BtKlU4/D8orjZbBAbgsgwnbpQkRTn9EB7ccd
 h6pDx3gieuu1fNXDBYbJJDIGBbKUKtZRFvrgAkNVXtHMTLJJfn5lGrmDoXtasZ49/jHn
 1G187isgJf+0QxaAH94cHA0QqFuO55tObvIAbrTpF2mz9MFQkO8ZonDX58w/tgUfJX3X
 XDC+cyW/HYIlkrkMSZam7B+eEC5FMkWMEAUONKBJcGhqM2Bs7JKBwlN+QCOjyCLRgP1s
 NACjHF/b8XgpxYkTNFLGAMSXcEPOOYA1jwCrO10PL2TD8zh8nlb9kG8rEoXFTbj3nH6k
 eVYA==
X-Gm-Message-State: AOAM532h7tqKmOz27PxL63taKsSk5NZ8swQldmVCAaPErKeEr1g27aEV
 fUn6uFVhMBK34X2YX2ZitYJ8GOBfgczlcxqT6W8F5TCZetogz+QYDExfVyCtnPuGqGvYdN1zyix
 /ufcnaDKx7leNvIM=
X-Received: by 2002:a17:902:d892:b0:14e:e074:7ff7 with SMTP id
 b18-20020a170902d89200b0014ee0747ff7mr26311476plz.29.1645602629210; 
 Tue, 22 Feb 2022 23:50:29 -0800 (PST)
X-Google-Smtp-Source: ABdhPJx2d5eBYY2Np5Grn6pW1D5M4e9TnzjDr6aQPXukxjJBTN4bHEAqpAcWW2MkPs+YuOEtOLNg4g==
X-Received: by 2002:a17:902:d892:b0:14e:e074:7ff7 with SMTP id
 b18-20020a170902d89200b0014ee0747ff7mr26311465plz.29.1645602628936; 
 Tue, 22 Feb 2022 23:50:28 -0800 (PST)
Received: from xz-m1.local ([94.177.118.100])
 by smtp.gmail.com with ESMTPSA id s24sm23430267pgq.51.2022.02.22.23.50.26
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 22 Feb 2022 23:50:28 -0800 (PST)
Date: Wed, 23 Feb 2022 15:50:24 +0800
From: Peter Xu <peterx@redhat.com>
To: "Dr. David Alan Gilbert" <dgilbert@redhat.com>
Subject: Re: [PATCH 20/20] tests: Add postcopy preempt test
Message-ID: <YhXnQLY4/b3V2+VL@xz-m1.local>
References: <20220216062809.57179-1-peterx@redhat.com>
 <20220216062809.57179-21-peterx@redhat.com>
 <YhTcb9o1d1gCQ3rm@work-vm>
MIME-Version: 1.0
In-Reply-To: <YhTcb9o1d1gCQ3rm@work-vm>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=peterx@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Received-SPF: pass client-ip=170.10.133.124; envelope-from=peterx@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H5=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
Cc: Leonardo Bras Soares Passos <lsoaresp@redhat.com>, qemu-devel@nongnu.org,
 Juan Quintela <quintela@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Tue, Feb 22, 2022 at 12:51:59PM +0000, Dr. David Alan Gilbert wrote:
> * Peter Xu (peterx@redhat.com) wrote:
> > Two tests are added: a normal postcopy preempt test, and a recovery test.
> 
> Yes, this is difficult; without hugepages the tests are limited; did you
> see if this test actually causes pages to go down the fast path?

I didn't observe the test case explicitly, but I did observe in my own test
that I ran that it goes with the fast path, or I can't get a huge speed up.

Meanwhile my own test is only using 2M huge pages, and I can observe
interruptions of huge page sendings frequently.

But yeah let me try to capture something in this test too, at least to make
sure the standalone socket is being used.  Covering of huge pages might be
doable but obviously requires host privileges, so I'll leave that for later.

> 
> 
> 
> Reviewed-by: Dr. David Alan Gilbert <dgilbert@redhat.com>

Thanks,

-- 
Peter Xu


