Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9B84F583254
	for <lists+qemu-devel@lfdr.de>; Wed, 27 Jul 2022 20:48:56 +0200 (CEST)
Received: from localhost ([::1]:53662 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oGm5X-0001uC-6A
	for lists+qemu-devel@lfdr.de; Wed, 27 Jul 2022 14:48:55 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47228)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ani@anisinha.ca>) id 1oGlvA-0002Dq-I4
 for qemu-devel@nongnu.org; Wed, 27 Jul 2022 14:38:12 -0400
Received: from mail-qv1-xf34.google.com ([2607:f8b0:4864:20::f34]:44653)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <ani@anisinha.ca>) id 1oGlv8-0000gg-Qq
 for qemu-devel@nongnu.org; Wed, 27 Jul 2022 14:38:12 -0400
Received: by mail-qv1-xf34.google.com with SMTP id b11so8974071qvo.11
 for <qemu-devel@nongnu.org>; Wed, 27 Jul 2022 11:38:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=anisinha-ca.20210112.gappssmtp.com; s=20210112;
 h=from:date:to:cc:subject:in-reply-to:message-id:references
 :user-agent:mime-version;
 bh=at7Cvtwdl90mNmRQ8738Yz0KVnl+htopHEjZ21dLs+U=;
 b=nEZ6bF0Axja3ifp6l7dmW/UlBLpD/hta2vKGlpt+GPqLQGyOsFnbPrsWh3ELGSvseh
 jID70MLELYLg7+fU0s8PW8wg3gKhucegBfMzT7Hw1zJcVVVPfLFlzgtM9MObkmeXSjZ9
 1xUUHkx+P2mFBvQHT0Q2vQrNSay38v5ga/uZ7waLpNJTPjHImrQ3D1NYCDC1lxR4e/8c
 JjBrc5o3Tu/QL1jx4I7GENKi3e9gXKfdIBZHNEj84jIeD9r3y5UxpGTRXb+rr1VRfQZ0
 df1PXgQKW4jXPWlhpmINtPfVGqis5DlcsJ05IM8/4Mf4MTiSUSLZj1Ja84oCO8eZiAav
 fT1g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:date:to:cc:subject:in-reply-to:message-id
 :references:user-agent:mime-version;
 bh=at7Cvtwdl90mNmRQ8738Yz0KVnl+htopHEjZ21dLs+U=;
 b=KAABZuyd1+6xCoKba68xk+5P6E9+xZ922qFehfYXoqE4isGSPgA1EHCVFC6N4Dnqgg
 n9o+aZ97A5SSFQbnx5KzclV0RcI2vqVVh2M4tqQJkFm5oQGUigsvaisRnIdwFCCibWSo
 WPlULcdBpb4CfZw5ys8c5lJpAwfG2a1Oori6p1kuP/iA+8rmpbrjGMC1QNuqVVzyAEID
 fHjZLkQrh0chiLD2izlXScS0N4Y3e57w7KFHXGCwZfCs71U5Q2GOV88yJF6gDR3+JzqT
 f9hfIJoCYXgCaRz7ANynCd627Kx5Kz3gu9LP8Bw7sXlUNGThf+sGVDalvrHMgf9sikbM
 3HFg==
X-Gm-Message-State: AJIora98/qbz5a0rrxnPUlpGWt/fPyl1fBeJOkdh7yoRSdGgQ/IzkRMY
 0zrTNXa3Tf52S6sOtcucDLI0yg==
X-Google-Smtp-Source: AGRyM1sYepU5eI00OtlgyGg1ro+lxKVAKxpnf7Sp8k4nocrnnMm5oq0j4keMSRipLt8wuzoXaexUGw==
X-Received: by 2002:a0c:8c0f:0:b0:473:a6f7:aa5b with SMTP id
 n15-20020a0c8c0f000000b00473a6f7aa5bmr20130401qvb.23.1658947089032; 
 Wed, 27 Jul 2022 11:38:09 -0700 (PDT)
Received: from snn377.eng.timetra.com ([208.184.70.254])
 by smtp.googlemail.com with ESMTPSA id
 m17-20020ac866d1000000b0031eaabd2117sm11142844qtp.12.2022.07.27.11.38.07
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 27 Jul 2022 11:38:08 -0700 (PDT)
From: Ani Sinha <ani@anisinha.ca>
X-Google-Original-From: Ani Sinha <anisinha@anisinha.ca>
Date: Wed, 27 Jul 2022 11:38:05 -0700 (PDT)
X-X-Sender: anisinha@anisinha-lenovo
To: Ani Sinha <ani@anisinha.ca>
cc: "Michael S. Tsirkin" <mst@redhat.com>, berrange@redhat.com, 
 imammedo@redhat.com, jsnow@redhat.com, pbonzini@redhat.com, 
 peter.maydell@linaro.org, qemu-devel@nongnu.org, thuth@redhat.com
Subject: Re: [PATCH v2 07/11] acpi/tests/bits: add python test that exercizes
 QEMU bios tables using biosbits
In-Reply-To: <alpine.DEB.2.22.394.2207251100590.87138@anisinha-lenovo>
Message-ID: <alpine.DEB.2.22.394.2207271137210.130455@anisinha-lenovo>
References: <20220710170014.1673480-1-ani@anisinha.ca>
 <20220710170014.1673480-8-ani@anisinha.ca>
 <20220714163611-mutt-send-email-mst@kernel.org>
 <alpine.DEB.2.22.394.2207150929020.2162493@anisinha-lenovo>
 <20220715015941-mutt-send-email-mst@kernel.org>
 <CAARzgwwjXMmbRQ-ETPPqHP5eq5jtrGMSh2GeBh5fLS9Pcsut+A@mail.gmail.com>
 <20220716112943-mutt-send-email-mst@kernel.org>
 <alpine.DEB.2.22.394.2207251100590.87138@anisinha-lenovo>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="2088271309-896558-1658947088=:130455"
Received-SPF: none client-ip=2607:f8b0:4864:20::f34;
 envelope-from=ani@anisinha.ca; helo=mail-qv1-xf34.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_NONE=0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

--2088271309-896558-1658947088=:130455
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8BIT



On Mon, 25 Jul 2022, Ani Sinha wrote:

>
>
> On Sat, 16 Jul 2022, Michael S. Tsirkin wrote:
>
> > On Sat, Jul 16, 2022 at 12:06:00PM +0530, Ani Sinha wrote:
> > >
> > >
> > > On Fri, Jul 15, 2022 at 11:20 Michael S. Tsirkin <mst@redhat.com> wrote:
> > >
> > >     On Fri, Jul 15, 2022 at 09:47:27AM +0530, Ani Sinha wrote:
> > >     > > Instead of all this mess, can't we just spawn e.g. "git clone --depth
> > >     1"?
> > >     > > And if the directory exists I would fetch and checkout.
> > >     >
> > >     > There are two reasons I can think of why I do not like this idea:
> > >     >
> > >     > (a) a git clone of a whole directory would download all versions of the
> > >     > binary whereas we want only a specific version.
> > >
> > >     You mention shallow clone yourself, and I used --depth 1 above.
> > >
> > >     > Downloading a single file
> > >     > by shallow cloning or creating a git archive is overkill IMHO when a wget
> > >     > style retrieval works just fine.
> > >
> > >     However, it does not provide for versioning, tagging etc so you have
> > >     to implement your own schema.
> > >
> > >
> > > Hmm I’m not sure if we need all that. Bits has its own versioning mechanism and
> > > I think all we need to do is maintain the same versioning logic and maintain
> > > binaries of different  versions. Do we really need the power of git/version
> > > control here? Dunno.
> >
> > Well we need some schema. Given we are not using official bits releases
> > I don't think we can reuse theirs.
>
> OK fine. Lets figuire out how to push bits somewhere in git.qemu.org and
> the binaries in some other repo first. Everything else hinges on that. We
> can fix the rest of the bits later incrementally.

DanPB, any thoughts on putting bits on git.qemu.org or where and how to
keep the binaries?
--2088271309-896558-1658947088=:130455--

