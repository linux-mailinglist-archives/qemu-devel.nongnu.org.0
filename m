Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E6AD6652270
	for <lists+qemu-devel@lfdr.de>; Tue, 20 Dec 2022 15:25:15 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p7dCx-00064y-LD; Tue, 20 Dec 2022 09:03:03 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <16567adigashreesh@gmail.com>)
 id 1p7dCr-00063G-5a
 for qemu-devel@nongnu.org; Tue, 20 Dec 2022 09:02:57 -0500
Received: from mail-pj1-x102e.google.com ([2607:f8b0:4864:20::102e])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <16567adigashreesh@gmail.com>)
 id 1p7dCp-0002ZV-KH
 for qemu-devel@nongnu.org; Tue, 20 Dec 2022 09:02:56 -0500
Received: by mail-pj1-x102e.google.com with SMTP id v23so7255509pju.3
 for <qemu-devel@nongnu.org>; Tue, 20 Dec 2022 06:02:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date:from:to
 :cc:subject:date:message-id:reply-to;
 bh=zeeIt6SUNe/dMiymi071KLPLP9FWY2NY36sHxGfEgsk=;
 b=cH8/6oLR8isGzLPs+M36KJ7Awq6rdVp7N7BO40z0mtWPAbknFC+5RbCSlGlgT8V87b
 Lzq5FVgSb9P+6bcrOAHqo52ld6Y5O+63RmCHvtvPbvwykcT8JMB0qUWk7jKQ4lCkrBwC
 +X1yXrDkbxSUKYkKQgpsg29phJkkcB/VpAWnzAj5zJPNlKz83BH0JyB1cpgGeszDgpGe
 vKL6ZVhtxuGb2OIcaDOpdDa9X4hDF2Vy43eoZLtjv7o3y53uZaT2WflWXMaVhKZSNPKB
 x05CjocHE7XYB/GixC5gsTZs+Qch2fIdjKRMP3Az4jNnlBN2pXaf0nU2a/Cwi+3Mk0R0
 8F+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=zeeIt6SUNe/dMiymi071KLPLP9FWY2NY36sHxGfEgsk=;
 b=3JaOlb3gtpPA24uMWGN6MrMKp53nMRWMgc8g4mIyvlYg+tN/k6nF7XQnQVV2pghFNj
 eVLe1sdcR1EJr2PJQfJj0aqyU7KznbSIuB8K4Zy4oDLh9zeu0K+57cIi7hSoizTcwGDn
 zf2iB1ku5m/I7ooM2Ds2kqZw/v7OjtouUwHicBRz83TdNSEFVwl64dP6zDC26QqEqKgK
 aa6Wslj4LkN1rROpAqYu1964LnVY0HEzPySSk0uJmJ1koVg+Hv1TiF6o19hxaZdWC/bg
 VJ7VvfrPb2PaWghzoBS2CBVkIEOzSDe0ZlmttzPMQTrMxm4Pw+XmUdpgZK30RLm3u136
 +DXA==
X-Gm-Message-State: AFqh2kq+K8A0PSfUVKO9Mti7lNbEvCoKGahWwRlwUa1DzMPJDIw6swKB
 t3WKBQ896vP+vgJoFlMoPZM=
X-Google-Smtp-Source: AMrXdXtInDcCN+MSjVhSQsKBJrulpTSZWp9KSDdatYoa18BE+sMBczwZFft1JNZFkVv8WExkETB/+Q==
X-Received: by 2002:a17:903:25d1:b0:190:f82f:c937 with SMTP id
 jc17-20020a17090325d100b00190f82fc937mr21660570plb.42.1671544973542; 
 Tue, 20 Dec 2022 06:02:53 -0800 (PST)
Received: from arch.localdomain ([49.206.0.157])
 by smtp.gmail.com with ESMTPSA id
 p6-20020a170902a40600b001766a3b2a26sm9387308plq.105.2022.12.20.06.02.50
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 20 Dec 2022 06:02:52 -0800 (PST)
Date: Tue, 20 Dec 2022 19:32:47 +0530
From: Shreesh Adiga <16567adigashreesh@gmail.com>
To: Daniel =?iso-8859-1?Q?P=2E_Berrang=E9?= <berrange@redhat.com>
Cc: qemu-devel@nongnu.org, jasowang@redhat.com, andrew@daynix.com,
 yuri.benditovich@daynix.com
Subject: Re: [PATCH] ebpf: fix compatibility with libbpf 1.0+
Message-ID: <Y6HAh5/u9N50wMah@arch.localdomain>
References: <20221218143927.597975-1-16567adigashreesh@gmail.com>
 <Y6BDeYCy309Ug4G5@redhat.com> <Y6Bq1nQwu6DitPLY@arch.localdomain>
 <Y6Br8RW4dwdMohCN@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <Y6Br8RW4dwdMohCN@redhat.com>
Received-SPF: pass client-ip=2607:f8b0:4864:20::102e;
 envelope-from=16567adigashreesh@gmail.com; helo=mail-pj1-x102e.google.com
X-Spam_score_int: -13
X-Spam_score: -1.4
X-Spam_bar: -
X-Spam_report: (-1.4 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 FROM_STARTS_WITH_NUMS=0.738, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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

On Mon, Dec 19, 2022 at 01:49:37PM +0000, Daniel P. Berrangé wrote:
> On Mon, Dec 19, 2022 at 07:14:54PM +0530, Shreesh Adiga wrote:
> > Hi Daniel,
> >
> > On Mon, Dec 19, 2022 at 10:56:57AM +0000, Daniel P. Berrangé wrote:
> > > On Sun, Dec 18, 2022 at 08:09:27PM +0530, Shreesh Adiga wrote:
> > > > The current implementation fails to load on a system with
> > > > libbpf 1.0 and reports that legacy map definitions in 'maps'
> > > > section are not supported by libbpf v1.0+. This commit updates
> > > > the Makefile to add BTF (-g flag) and appropriately updates
> > > > the maps in rss.bpf.c and update the skeleton file in repo.
> > >
> > > Can you split this into two pieces - one updating the build
> > > system for new compiler usage, and one updating the program
> > > to remove the legacy map defs.
> > >
> > If I just update the Makefile first, rss.bpf.c doesn't compile
> > and throws error:
> > rss.bpf.c:80:1: error: variable has incomplete type 'struct bpf_map_def'
> >
> > Similarly if first rss.bpf.c only is updated, then error is thrown:
> > libbpf: BTF is required, but is missing or corrupted
> > Hence, it would seem logical to update both of them together in same
> > commit.
> >
> > Do you mean first commit should update the Makefile and rss.bpf.c
> > together and second commit should be updating the rss.bpf.skeleton.h
> > file? I was under the impression that every commit should result in
> > compilable sources, hence wanted to clarify this.
>
> Yes, it must be compilable. I was under the impression from the
> commit that these were independant changes, but I was wrong.
>
Could you please confirm if the current single patch is good enough for
submission, or do I need to send a v2 series with changes split into
two commits, one for Makefile + rss.bpf.c and second one for skeleton
file update?

Thanks,
Shreesh

