Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4E4E9633DEC
	for <lists+qemu-devel@lfdr.de>; Tue, 22 Nov 2022 14:42:29 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1oxTW6-00058f-MD; Tue, 22 Nov 2022 08:40:50 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1oxTW2-00058C-To
 for qemu-devel@nongnu.org; Tue, 22 Nov 2022 08:40:47 -0500
Received: from mail-pf1-x435.google.com ([2607:f8b0:4864:20::435])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1oxTVy-0004ZP-18
 for qemu-devel@nongnu.org; Tue, 22 Nov 2022 08:40:46 -0500
Received: by mail-pf1-x435.google.com with SMTP id y13so14384407pfp.7
 for <qemu-devel@nongnu.org>; Tue, 22 Nov 2022 05:40:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=eGZl5MR383EDLkMFu4CiNdwBldjRqi6X6iIfUUmsxA8=;
 b=M0bcxgO+8tVCczv5IF63PwAK+NUaVlittdBTNM49YKHS2JVVnkXVfItQykxlV4bF7U
 9KcHZ00aEO2dqwJxqHBdDGrEHR3l+gGyGo5apn3UXc5kadMF04DqCPIBq2HG/nz2PVFa
 bgzpbdqIMwI+mJTxqUj8BulU/Qs0t7PvZTW3mT16LFGpKKmyI2HD23MS40ZObNn+PKmL
 2wwl1PO63MZr2vLU/ZUrYwNpWLvzjS4oUL5Nsk/+p86+FQOTtnJF61thDgYa345N+09B
 2a/Cq/3qJEBVcISg+SyjHxTTGJCmmKbqwHC+6SLRfiLcVvSUFroUE9i6gBBwpOMnlBPK
 vvOg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=eGZl5MR383EDLkMFu4CiNdwBldjRqi6X6iIfUUmsxA8=;
 b=k1woQ6cm3gajjsu/kSVgQIcBe+hxn/AyfVzL/lTF3z+50RBD2MfNPdo8tJvzwLb8VH
 KOe/7mzi9OMviKE0rj/1bY2i+FYw/0/Z9hzNatgPYi5h06X6jf7FPQPaN3YBXdLQ9Z4C
 0f0IWTTG6hD6YVQk4Sm1Wu3zmXfSkXlPDnWQFPJyZzcFvcu+toNzFubA6nYfNln1CVFU
 GEVphDXA+44SEYJHCFtdBJgL9sOJtnBFOSVx5s3/4SE2UYCN5J5fO6j25/Or2OdXCjjO
 GjwhN77rwJ3vlmQeS1h8LXz+P/u9ZxJGkGIpypI9tkKMkvU04XNduUli24RwtRtZjOSv
 ssWQ==
X-Gm-Message-State: ANoB5pkoNMwvi1tiZFPOxuh/XtlabuXbcJRpnJaZp0s0sDPZiuGV54CT
 iZq+WjWipcGiR1cNT4StE4fkdZ4UYDSMvz/SEfIdqQ==
X-Google-Smtp-Source: AA0mqf69tNAKxprmktexxwjM58DxaAgYKQbEVhAZbuLLB/KwB3WW59sbUAYZ5JVt3aBGfv8cxGxyMFXt/Fx9kI/UeDs=
X-Received: by 2002:aa7:9ed0:0:b0:571:8549:89c3 with SMTP id
 r16-20020aa79ed0000000b00571854989c3mr4103540pfq.26.1669124440351; Tue, 22
 Nov 2022 05:40:40 -0800 (PST)
MIME-Version: 1.0
References: <1668789029-5432-1-git-send-email-mihai.carabas@oracle.com>
 <CAFEAcA_H8UEcp4HNFe1CwaheLxg7453QQBjTa9wSnsW6TgsRKA@mail.gmail.com>
 <eea06d91-492b-3c1a-6e0d-5e52507b3b1a@oracle.com>
 <CAFEAcA8isy4_0iYHWX+3RksCNQwT3U_SH14xg6t-KUPx4b9d=Q@mail.gmail.com>
 <4b4ea622-871f-749a-1de3-b260e1d64b1f@oracle.com>
 <CAFEAcA8BpE2N_91J1HXRvC0CqWLwpMhgU6prh6aO3PLO1C4Lww@mail.gmail.com>
In-Reply-To: <CAFEAcA8BpE2N_91J1HXRvC0CqWLwpMhgU6prh6aO3PLO1C4Lww@mail.gmail.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 22 Nov 2022 13:40:28 +0000
Message-ID: <CAFEAcA_LYASx7t9pNJs8BsQUwdEsNNq8P-a38PhJ36ivJFLRDg@mail.gmail.com>
Subject: Re: [PATCH] target/arm: build smbios 19 table
To: Mihai Carabas <mihai.carabas@oracle.com>
Cc: qemu-arm@nongnu.org, qemu-devel@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::435;
 envelope-from=peter.maydell@linaro.org; helo=mail-pf1-x435.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On Mon, 21 Nov 2022 at 11:43, Peter Maydell <peter.maydell@linaro.org> wrote:
>
> On Mon, 21 Nov 2022 at 11:24, Mihai Carabas <mihai.carabas@oracle.com> wrote:
> >
> > La 21.11.2022 13:02, Peter Maydell a scris:
> > > On Sun, 20 Nov 2022 at 17:53, Mihai Carabas <mihai.carabas@oracle.com> wrote:
> > >> La 18.11.2022 21:11, Peter Maydell a scris:
> > >>> On Fri, 18 Nov 2022 at 17:37, Mihai Carabas <mihai.carabas@oracle.com> wrote:
> > >>>> Use the base_memmap to build the SMBIOS 19 table which provides the address
> > >>>> mapping for a Physical Memory Array (from spec [1] chapter 7.20).
> > >>>>
> > >>>> This was present on i386 from commit c97294ec1b9e36887e119589d456557d72ab37b5
> > >>>> ("SMBIOS: Build aggregate smbios tables and entry point").
> > >>>>
> > >>>> [1] https://urldefense.com/v3/__https://www.dmtf.org/sites/default/files/standards/documents/DSP0134_3.5.0.pdf__;!!ACWV5N9M2RV99hQ!KF2xmQw9nxPvqvNCgDleyVHv4MoZseoZFHmR1veww7O2BmRxSH1spOCNWX-c-FvzcaR_o8PunXSWWH2ECvFqlR4E7vw$
> > >>>>
> > >>>> Signed-off-by: Mihai Carabas <mihai.carabas@oracle.com>
> > >>> Is this a bug fix, or a new feature? What are the consequences
> > >>> of it being missing? Is this important enough to go into the 7.2
> > >>> release? (My default position would be "no", given this has been
> > >>> like this on the virt board for a very long time.)
> > >>
> > >> This is required by ARM SystemReady Virtual Environment [1]. As
> > >> described in the Arm SystemReady Requirements Specification v2.0
> > >>    [2] page 9, 2.5.1 SystemReady Virtual Environment (VE) v1.0
> > >> requirements,: "FirmwareTestSuite (FWTS) must still be used" -> fwts
> > >> checks for the presence of SMBIOS type 19 table and fails the test in
> > >> this case.
> > > OK, so it's a spec requirement. Are there any actual realworld
> > > guests that don't work because we get this wrong ?
> >
> > We do not have a clear example. The thing we hit was the ARM SystemReady
> > certification based on fwts.
>
> Thanks for clarifying; in that case given we're quite far along
> in the 7.2 release cycle I think we shouldn't try to get this
> patch in to that release but instead put it in for 8.0.

I checked how x86 sets up this smbios table, and it doesn't
put any pluggable DIMMs in it, only the initial fixed RAM,
so I'm happy that virt doesn't need to do anything special
there. I've applied this patch to a target-arm-for-8.0 branch
that will eventually turn into target-arm when 7.2 is released
in a few weeks time.

I've tweaked the commit message to make it clear that this
is fixing a spec issue which doesn't to our knowledge
cause any guest OS problems.

thanks
-- PMM

