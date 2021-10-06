Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 757274246A2
	for <lists+qemu-devel@lfdr.de>; Wed,  6 Oct 2021 21:22:04 +0200 (CEST)
Received: from localhost ([::1]:53912 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mYCUN-0006Uz-Gk
	for lists+qemu-devel@lfdr.de; Wed, 06 Oct 2021 15:22:03 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45818)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <wrampazz@redhat.com>)
 id 1mYCSW-0004y1-1d
 for qemu-devel@nongnu.org; Wed, 06 Oct 2021 15:20:08 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:59386)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <wrampazz@redhat.com>)
 id 1mYCSU-0003oF-Ff
 for qemu-devel@nongnu.org; Wed, 06 Oct 2021 15:20:07 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1633548005;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=13xLELdS/DGjDGN54f9Q/qdNp7kdVyMKf8NsbeVgb08=;
 b=jJJQ/HCSCUPsbT9OG6MqTPFKmBuB5MC/HiFBmIAClmgzHWG94WASRf9KFItHgfOrqMCGdJ
 BG1XrngY2hQraloalIFypbeFPbsGkCaEKOoDgQYjHVX5oNJY6Mh/pvgnHBlNJzMlBEtKcV
 k/vnEvnJ468/cWFQ1uS18WjKJDK+OR8=
Received: from mail-pf1-f197.google.com (mail-pf1-f197.google.com
 [209.85.210.197]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-15-32UwBn4mMs6TdbVaqwO3sQ-1; Wed, 06 Oct 2021 15:20:04 -0400
X-MC-Unique: 32UwBn4mMs6TdbVaqwO3sQ-1
Received: by mail-pf1-f197.google.com with SMTP id
 142-20020a621694000000b0044c801e5befso1874617pfw.11
 for <qemu-devel@nongnu.org>; Wed, 06 Oct 2021 12:20:03 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=13xLELdS/DGjDGN54f9Q/qdNp7kdVyMKf8NsbeVgb08=;
 b=cgoXWPF7HeQwLmzZFimVeYBRy2FpOKflOYLVX3byclEMQsLOD5cCOGs4Lln8bDTPEo
 dvsM3I53ZqyH+frJZS7AeS3RxWGCJ8HwBA5ToaBA2YJHcEQHvrrga0zapY1+8TSUZkH1
 nJyqO+AEAPT65vuLTQGLPQXjFjshfdzkF7kknz27+RrRISgKMiOB3KSSFEcx1P32ncnD
 rPyp/9Eu6NrWXZBFyfaY7FWBmc1uVd2L5Mx5HP2hXaNnwuYaBMO8kjjzxvOvZE3WxdHL
 DLp30S0uGaHDG8v1jyAEIMrhLh/kFRp3TtwondbKUDOh6oRBbB2zVLQCfLajt/e+piLj
 wKUA==
X-Gm-Message-State: AOAM532U0J1cdVWrf8JScH3m/eECHlDJhwybMwe4jy+PSUvUYp2Rg1nG
 LBMNGxPg6cud2oaEyMRoBIK4ZryydlGU5GOXDzY0TyHGDPPzCzYl19lD0UdLaT7ZtIdQzIPz9mM
 yW0lGZlsKDEgl1FjggipqzhEueBMFB7w=
X-Received: by 2002:a17:90a:fa4f:: with SMTP id
 dt15mr51218pjb.10.1633548002855; 
 Wed, 06 Oct 2021 12:20:02 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJx0tWJku0IPI+GFQcma2ieH4J5Cavg5uPFuyt1O5HYYj0VYDYXhqdHCiKtWQEeTSeeAS5dI+i0ahqGnV5tbdNk=
X-Received: by 2002:a17:90a:fa4f:: with SMTP id
 dt15mr51176pjb.10.1633548002617; 
 Wed, 06 Oct 2021 12:20:02 -0700 (PDT)
MIME-Version: 1.0
References: <20210924185506.2542588-1-crosa@redhat.com>
 <20210924185506.2542588-17-crosa@redhat.com>
 <CAKJDGDZ0wXko+34sQujsd7iLKNRtm3BhZ=DFpD6nXtvZVF2uRg@mail.gmail.com>
In-Reply-To: <CAKJDGDZ0wXko+34sQujsd7iLKNRtm3BhZ=DFpD6nXtvZVF2uRg@mail.gmail.com>
From: Willian Rampazzo <wrampazz@redhat.com>
Date: Wed, 6 Oct 2021 16:19:36 -0300
Message-ID: <CAKJDGDaer7Vf0jowqZJBqow9nVB8JbL_6O1_7sa=qPtJ=0VMfg@mail.gmail.com>
Subject: Re: [PATCH 16/16] tests/acceptance/ppc_prep_40p.py: unify tags
To: Cleber Rosa <crosa@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=wrampazz@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=170.10.129.124; envelope-from=wrampazz@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.05,
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
Cc: qemu-ppc@nongnu.org, Thomas Huth <thuth@redhat.com>,
 Beraldo Leal <bleal@redhat.com>, Yoshinori Sato <ysato@users.sourceforge.jp>,
 Pavel Dovgalyuk <pavel.dovgaluk@ispras.ru>,
 =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>,
 qemu-devel <qemu-devel@nongnu.org>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>, Greg Kurz <groug@kaod.org>,
 Auger Eric <eric.auger@redhat.com>, Kamil Rytarowski <kamil@netbsd.org>,
 =?UTF-8?Q?Herv=C3=A9_Poussineau?= <hpoussin@reactos.org>,
 Reinoud Zandijk <reinoud@netbsd.org>,
 David Gibson <david@gibson.dropbear.id.au>,
 Paolo Bonzini <pbonzini@redhat.com>, Alexandre Iooss <erdnaxe@crans.org>,
 Mahmoud Mandour <ma.mandourr@gmail.com>, Ryo ONODERA <ryoon@netbsd.org>,
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@redhat.com>,
 Eduardo Habkost <ehabkost@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Wed, Oct 6, 2021 at 4:17 PM Willian Rampazzo <wrampazz@redhat.com> wrote:
>
> On Fri, Sep 24, 2021 at 4:01 PM Cleber Rosa <crosa@redhat.com> wrote:
> >
> > The arch and machine tags apply to all tests, so let's define them
> > only once.
> >
> > Signed-off-by: Cleber Rosa <crosa@redhat.com>
> > ---
> >  tests/acceptance/ppc_prep_40p.py | 12 ++++--------
> >  1 file changed, 4 insertions(+), 8 deletions(-)
> >
>
> Reviewed-by: Willian Rampazzo <willianr@redhat.com>

Also:
Tested-by: Willian Rampazzo <willianr@redhat.com>


