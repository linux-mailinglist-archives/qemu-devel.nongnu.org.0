Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E8FCA567FEF
	for <lists+qemu-devel@lfdr.de>; Wed,  6 Jul 2022 09:34:44 +0200 (CEST)
Received: from localhost ([::1]:42806 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o8zYY-0003zl-KM
	for lists+qemu-devel@lfdr.de; Wed, 06 Jul 2022 03:34:43 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38090)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dominique.martinet@atmark-techno.com>)
 id 1o8zRP-0001EQ-UV
 for qemu-devel@nongnu.org; Wed, 06 Jul 2022 03:27:28 -0400
Received: from gw2.atmark-techno.com ([35.74.137.57]:37164)
 by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <dominique.martinet@atmark-techno.com>)
 id 1o8zRM-0005Vm-TZ
 for qemu-devel@nongnu.org; Wed, 06 Jul 2022 03:27:19 -0400
Received: from mail-pf1-f199.google.com (mail-pf1-f199.google.com
 [209.85.210.199])
 by gw2.atmark-techno.com (Postfix) with ESMTPS id 1C6D120D08
 for <qemu-devel@nongnu.org>; Wed,  6 Jul 2022 16:27:11 +0900 (JST)
Received: by mail-pf1-f199.google.com with SMTP id
 d7-20020a056a0010c700b0052894ee16d8so1455956pfu.6
 for <qemu-devel@nongnu.org>; Wed, 06 Jul 2022 00:27:11 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=uJKHvHZyVzw7R/Mnmq0sPEGwAwhtlLdPkCCsaie5QC0=;
 b=u4IZ8u3KtKc2DRE+K/G1lDd08SCKvL+U9K9E4jnD9Zmz5UafLg0BmNQoYlITuoXUQK
 yONPlmaiKCSTLUjbdjBE+uAcEkcDcjZ77kC8nr/i63wCUCn1/Au3wrOvqGoOlQShTKVC
 bwhtHgUHYZEKLDN3C3oPiwkn9aOzNY8INI5blac03nzSPFbxEQ9236kQolEFNYhWV0LC
 eiIZAaBWMmg1M1C0eXb5ps3Ib8XS/Jf3CjWpWUcN7K9US6zRwo31g6z4VD2WjFu6ZEjY
 Z1fifQxOr0KYvOp+Obn7CoP0is+oiZUapVkdvsehZ0Ag1G1U7nE7WNSfTn+HW6ax/Qlz
 iKmA==
X-Gm-Message-State: AJIora/34BZE8xTvOK7bFhD9snJ502y+fNYBNLb6NwgZ4EpNAFI1GVUw
 X/TBubvJHgXanhwPNrE6h8b0qInqWsnfLoPbbTUn+Ej2SD8jdXtgTTh0FSyRWfzj0vYC4mZB72M
 y3EiA7o6fQ1rJ6uV7
X-Received: by 2002:a17:90a:4b89:b0:1ee:e6b0:ee80 with SMTP id
 i9-20020a17090a4b8900b001eee6b0ee80mr47983019pjh.16.1657092431063; 
 Wed, 06 Jul 2022 00:27:11 -0700 (PDT)
X-Google-Smtp-Source: AGRyM1uJDPJs9lWtm67rT4aTF09fm3jDy/9I4mBn+f6jtffQXX6IIbxTCn8AxGbjAVUMYBaszvM/gQ==
X-Received: by 2002:a17:90a:4b89:b0:1ee:e6b0:ee80 with SMTP id
 i9-20020a17090a4b8900b001eee6b0ee80mr47982994pjh.16.1657092430848; 
 Wed, 06 Jul 2022 00:27:10 -0700 (PDT)
Received: from pc-zest.atmarktech (145.82.198.104.bc.googleusercontent.com.
 [104.198.82.145]) by smtp.gmail.com with ESMTPSA id
 v2-20020a056a00148200b00525343b5047sm24067543pfu.76.2022.07.06.00.27.10
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Wed, 06 Jul 2022 00:27:10 -0700 (PDT)
Received: from martinet by pc-zest.atmarktech with local (Exim 4.95)
 (envelope-from <martinet@pc-zest>) id 1o8zRF-005z7P-Ge;
 Wed, 06 Jul 2022 16:27:09 +0900
Date: Wed, 6 Jul 2022 16:26:59 +0900
From: Dominique Martinet <dominique.martinet@atmark-techno.com>
To: Stefan Hajnoczi <stefanha@gmail.com>
Cc: Stefan Hajnoczi <stefanha@redhat.com>, Jens Axboe <axboe@kernel.dk>,
 Stefano Garzarella <sgarzare@redhat.com>,
 Aarushi Mehta <mehta.aaru20@gmail.com>,
 Julia Suvorova <jusual@redhat.com>, Kevin Wolf <kwolf@redhat.com>,
 Hanna Reitz <hreitz@redhat.com>, qemu block <qemu-block@nongnu.org>,
 qemu-devel <qemu-devel@nongnu.org>,
 Filipe Manana <fdmanana@kernel.org>, io-uring@vger.kernel.org
Subject: Re: [PATCH v2] io_uring: fix short read slow path
Message-ID: <YsU5Q6p17yGsxxk+@atmark-techno.com>
References: <20220629044957.1998430-1-dominique.martinet@atmark-techno.com>
 <20220630010137.2518851-1-dominique.martinet@atmark-techno.com>
 <20220630154921.ekl45dzer6x4mkvi@sgarzare-redhat>
 <Yr4pLwz5vQJhmvki@atmark-techno.com>
 <YsQ8aM3/ZT+Bs7nC@stefanha-x1.localdomain>
 <YsTAxtvpvIIi8q7M@atmark-techno.com>
 <CAJSP0QUg5g6SDCy52carWRbVUFBhrAoiezinPdfhEOAKNwrN3g@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <CAJSP0QUg5g6SDCy52carWRbVUFBhrAoiezinPdfhEOAKNwrN3g@mail.gmail.com>
Received-SPF: pass client-ip=35.74.137.57;
 envelope-from=dominique.martinet@atmark-techno.com; helo=gw2.atmark-techno.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, SPF_HELO_PASS=-0.001,
 SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
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

Stefan Hajnoczi wrote on Wed, Jul 06, 2022 at 08:17:42AM +0100:
> Great! I've already queued your fix.

Thanks!

> Do you want to send a follow-up that updates the comment?

I don't think I'd add much value at this point, leaving it to you unless
you really would prefer me to send it.


Cheers,
-- 
Dominique

