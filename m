Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4A41E4D2962
	for <lists+qemu-devel@lfdr.de>; Wed,  9 Mar 2022 08:20:26 +0100 (CET)
Received: from localhost ([::1]:44578 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nRqcT-0003tW-Aq
	for lists+qemu-devel@lfdr.de; Wed, 09 Mar 2022 02:20:25 -0500
Received: from eggs.gnu.org ([209.51.188.92]:36752)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ani@anisinha.ca>) id 1nRqZj-0002OJ-HC
 for qemu-devel@nongnu.org; Wed, 09 Mar 2022 02:17:36 -0500
Received: from [2607:f8b0:4864:20::632] (port=38533
 helo=mail-pl1-x632.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <ani@anisinha.ca>) id 1nRqZh-0007hu-Ow
 for qemu-devel@nongnu.org; Wed, 09 Mar 2022 02:17:35 -0500
Received: by mail-pl1-x632.google.com with SMTP id t19so1208417plr.5
 for <qemu-devel@nongnu.org>; Tue, 08 Mar 2022 23:17:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=anisinha-ca.20210112.gappssmtp.com; s=20210112;
 h=from:date:to:cc:subject:in-reply-to:message-id:references
 :user-agent:mime-version;
 bh=nYGU51qxik7KEWVZ/+CRCkpXw5zWnO9NadXagowA25A=;
 b=6Uyh5vW9gCj4dGul0bOK1P9f+rghQuDuJyqWkn3tpvDpXjEuGPL9YxhEK+g7Lpa0EX
 ENZuGTwTwo0IPCUOAb4AiuaSnCaqLRGpvjhmuFdBzuWibZeHVsPRxMcMKKskKGZtRJz8
 sF2X1/aQsu7bieR8B/4uHwxSYZRX5JhaDPZ9QQcq34RBv31yL1CYnhrGZTQNDEVd5tvn
 6khiYduGwWTedcglgEyxPppxeZJ5fDPHmyvS2UsTsasabjLhYWiS+L8835DcyB7epumb
 PLpdlLiRcjBEyhTDhkOJPTNDzpWjihEj9WahWIzsMlUEj+D3MPx2IafgPgOABkxaVTx0
 1AlA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:date:to:cc:subject:in-reply-to:message-id
 :references:user-agent:mime-version;
 bh=nYGU51qxik7KEWVZ/+CRCkpXw5zWnO9NadXagowA25A=;
 b=ZE4timaI3fULhSdu4gzucFgOT0bPR9/h+4xOf0+OOGuYhDa846qEzsHnKqcKgpRx8K
 8nR6a9Q5FjFMXKoD7G1AAqafC2vqak62XFUIWy3d6TrOlnQbMbRhNLhxLamT5yzu6xgr
 Pt5hrKaKDYMg1EhwPtRIUU9vjp3qBRH0NfRAUpdzwRYLSsWV6ucPFp0nfMwvBIff8C0h
 t5ROf8Xd1LdI3JJI6zyOU4Osc9tE5y/NdNTsLcjWkSCK+YLv3apOoiuct80HKtqY8cec
 bxf+IexwoNXMzbnkumhzQGXh5SDN0svCbU0ArYWp2Odt4RaumqlcwiRSoRA/h+9JkSd/
 mg7A==
X-Gm-Message-State: AOAM531trHJaG091rGd5w4r6Kyumg6vMWLRTfJN0o36Yhft7UYnM2lsE
 jd2d/3vrd3ojwd8gW69qOL6DWQ==
X-Google-Smtp-Source: ABdhPJwWuzi1pC6B/D7sIz1GRC5RIp5jadJA6+TL95qeVZIrC+fEAs2lmKPLpGa1tkiycouGlpvjFg==
X-Received: by 2002:a17:902:ce08:b0:14f:85c1:773e with SMTP id
 k8-20020a170902ce0800b0014f85c1773emr21396548plg.99.1646810252123; 
 Tue, 08 Mar 2022 23:17:32 -0800 (PST)
Received: from anisinha-lenovo ([203.212.242.189])
 by smtp.googlemail.com with ESMTPSA id
 q15-20020a63504f000000b0037425262293sm1242743pgl.43.2022.03.08.23.17.29
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 08 Mar 2022 23:17:31 -0800 (PST)
From: Ani Sinha <ani@anisinha.ca>
X-Google-Original-From: Ani Sinha <anisinha@anisinha.ca>
Date: Wed, 9 Mar 2022 12:47:26 +0530 (IST)
X-X-Sender: anisinha@anisinha-lenovo
To: "Michael S. Tsirkin" <mst@redhat.com>
Subject: Re: [libvirt] [PATCH RESEND v2 0/4] re-introduce <acpi-hotplug-bridge>
In-Reply-To: <20220308121820-mutt-send-email-mst@kernel.org>
Message-ID: <alpine.DEB.2.22.394.2203091245190.2312236@anisinha-lenovo>
References: <20220308063955.2285902-1-ani@anisinha.ca>
 <399ca3a9-8b95-39af-8376-85f2edf00c7e@redhat.com>
 <f744a5f1-6dde-4b57-d52a-9b6104c5e510@redhat.com>
 <alpine.DEB.2.22.394.2203082212120.2312236@anisinha-lenovo>
 <20220308114638-mutt-send-email-mst@kernel.org>
 <CAARzgwwo6weTL8Q_2vbx9s2+r_LerEgDiWRLEJvgyC=YNVOVFw@mail.gmail.com>
 <20220308121820-mutt-send-email-mst@kernel.org>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::632
 (failed)
Received-SPF: none client-ip=2607:f8b0:4864:20::632;
 envelope-from=ani@anisinha.ca; helo=mail-pl1-x632.google.com
X-Spam_score_int: -4
X-Spam_score: -0.5
X-Spam_bar: /
X-Spam_report: (-0.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, PDS_HP_HELO_NORDNS=0.659, RCVD_IN_DNSWL_NONE=-0.0001,
 RDNS_NONE=0.793, SPF_HELO_NONE=0.001, SPF_NONE=0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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
Cc: libvir-list@redhat.com, jusual@redhat.com,
 qemu list <qemu-devel@nongnu.org>, Laine Stump <laine@redhat.com>,
 Ani Sinha <ani@anisinha.ca>, imammedo@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>



On Tue, 8 Mar 2022, Michael S. Tsirkin wrote:

> On Tue, Mar 08, 2022 at 10:23:20PM +0530, Ani Sinha wrote:
> > On Tue, Mar 8, 2022 at 10:17 PM Michael S. Tsirkin <mst@redhat.com> wrote:
> > >
> > > On Tue, Mar 08, 2022 at 10:15:11PM +0530, Ani Sinha wrote:
> > > >
> > > >
> > > > On Tue, 8 Mar 2022, Laine Stump wrote:
> > > >
> > > > > Aha! the domain of qemu-devel@nongnu.org was incorrect in the original send
> > > > > (it was "nognu.org"), so none of this thread was making it to that list.
> > > >
> > > >
> > > > Not to give any excuses but this happened because on Qemu side I never
> > > > have to type this manually. My git config is set up so that
> > > > the cc in send-email is filled up automatically using
> > > > scripts/get_maintainer.pl. On libvirt side also the domain and mailing
> > > > list is easy to remember. Its only when I have to manually type stuff that
> > > > shit happens :-)
> > >
> > > Donnu about alpine, but with mutt you can easily set up
> > > and alias and then it expands for you.
> >
> > I use alpine to only reply/review patches. I use git send-email to
> > actually send the patch. There I am not sure the best way to avoid
> > manually typing in the mailing list address.
>
> send-email supports aliases too.

Ah cool. I just set this up with some help from
https://felipec.wordpress.com/2009/10/25/git-send-email-tricks/ . Now I
can simply say

$ git send-email --to=qemu-list <patch>

without worrying about typo :-) Thanks for the pointer.


