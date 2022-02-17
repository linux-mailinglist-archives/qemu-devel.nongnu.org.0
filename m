Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BF1D24BA209
	for <lists+qemu-devel@lfdr.de>; Thu, 17 Feb 2022 14:56:19 +0100 (CET)
Received: from localhost ([::1]:56300 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nKhGc-0008IL-Ij
	for lists+qemu-devel@lfdr.de; Thu, 17 Feb 2022 08:56:18 -0500
Received: from eggs.gnu.org ([209.51.188.92]:60588)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ani@anisinha.ca>) id 1nKgtQ-00021H-JF
 for qemu-devel@nongnu.org; Thu, 17 Feb 2022 08:32:26 -0500
Received: from [2607:f8b0:4864:20::530] (port=40705
 helo=mail-pg1-x530.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <ani@anisinha.ca>) id 1nKgtN-0000ZW-By
 for qemu-devel@nongnu.org; Thu, 17 Feb 2022 08:32:19 -0500
Received: by mail-pg1-x530.google.com with SMTP id q132so5027699pgq.7
 for <qemu-devel@nongnu.org>; Thu, 17 Feb 2022 05:32:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=anisinha-ca.20210112.gappssmtp.com; s=20210112;
 h=from:date:to:cc:subject:in-reply-to:message-id:references
 :user-agent:mime-version;
 bh=Y8F/z2N/XRpxasvfUTYQLfqVkwYytbBBClchyWjaZFQ=;
 b=y7qBzWibWI2rSGOufgMRzMOidXcgAd2cJoN0Opi5iZzvx80ApYYglVp9Ggg6jVVFFt
 +EFjL4u3HxPXUqZsPsqCQ9MSkZ7FEHiwR2RRY5m9+vMRhA4vwosgydrrIfx+8O14iVYE
 O2gX/wx6HSzwv0EQFJ6+6pvLciiXcYdEOahmAIkrmE2oJqFqlSw8D7GuPecZe6rawHX7
 E1hklDV7ZcL5ffvORrKpm7WCfWchWuVprNZV6FxZfj7hvVg8Sjvi4uv4B/BIDZzBQjfr
 Ygk9kL5AQzltYLLVj+UA3c5p69NmTYzGjl3e49rBCLUR/MjLpYW8CwnMcNKXTVycqnLT
 8b1w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:date:to:cc:subject:in-reply-to:message-id
 :references:user-agent:mime-version;
 bh=Y8F/z2N/XRpxasvfUTYQLfqVkwYytbBBClchyWjaZFQ=;
 b=lRju1Ap78Ke69cnf4wPA9L0sBSCEdlXxMy9kGzK6XU6Xrccyq0/EDQ0YLa3qXPGCtr
 BqJw7aLZ4KyP3B2g8c80uazzD/67GswMS9lUVMYKMpS9EB4zUzp+8jELgMcMuqfaKjNT
 s7N4oO0xnfOep/Uak/6p8RfoYXscT+sZsOU8Wh0Gq3QFw2BI1UgJdQXuQ9DjH09dpfXT
 JTxd3NjSoKFEfvJhbmW3ZD3GyBCqmJ52Nl3w0+NHJ/bcv9nESr8AcldbiVXY7gzl50Eh
 DLz0x8L2ir1ChcZrsCRRkmJxoNCLZsaLGLflldmedT0Kj8pn7EIqjdt/Bzvz7Z+hIEBD
 +yZA==
X-Gm-Message-State: AOAM530f289waNk4esojeK8cxfj7xiEAEpPC2t+PeEVSbZguSmbeKhoU
 iHnhiQsDjZQgccOw4pHeUjKd9g==
X-Google-Smtp-Source: ABdhPJyZyzYv92N8IA1pOynIF8mE9+oHAvYBJ18XMK58Px2jlcV8ZwyZye+LL2zgCguFYQwU32Z0ng==
X-Received: by 2002:a63:28d:0:b0:365:8e16:5c19 with SMTP id
 135-20020a63028d000000b003658e165c19mr2433601pgc.579.1645104731063; 
 Thu, 17 Feb 2022 05:32:11 -0800 (PST)
Received: from anisinha-lenovo ([203.163.242.253])
 by smtp.googlemail.com with ESMTPSA id x1sm7992250pga.40.2022.02.17.05.32.08
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 17 Feb 2022 05:32:10 -0800 (PST)
From: Ani Sinha <ani@anisinha.ca>
X-Google-Original-From: Ani Sinha <anisinha@anisinha.ca>
Date: Thu, 17 Feb 2022 19:02:05 +0530 (IST)
X-X-Sender: anisinha@anisinha-lenovo
To: Igor Mammedov <imammedo@redhat.com>
Subject: Re: [PATCH v3 2/3] hw/smbios: fix table memory corruption with large
 memory vms
In-Reply-To: <20220217095430.38d2b6b7@redhat.com>
Message-ID: <alpine.DEB.2.22.394.2202171900100.294420@anisinha-lenovo>
References: <20220214141237.47946-1-ani@anisinha.ca>
 <20220214141237.47946-3-ani@anisinha.ca> <20220217095430.38d2b6b7@redhat.com>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: multipart/mixed;
 boundary="2088271309-591507682-1645104730=:294420"
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::530
 (failed)
Received-SPF: none client-ip=2607:f8b0:4864:20::530;
 envelope-from=ani@anisinha.ca; helo=mail-pg1-x530.google.com
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
Cc: Ani Sinha <ani@anisinha.ca>, qemu-devel@nongnu.org,
 "Michael S. Tsirkin" <mst@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

--2088271309-591507682-1645104730=:294420
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8BIT



On Thu, 17 Feb 2022, Igor Mammedov wrote:

> On Mon, 14 Feb 2022 19:42:35 +0530

> >
> > Buglink: https://bugzilla.redhat.com/show_bug.cgi?id=2023977
> s/buglink/Resolves/
>

OK I am curious about this one.

Per https://www.qemu.org/docs/master/devel/submitting-a-patch.html ,

If your patch fixes a bug in the gitlab bug tracker, please add a line
with “Resolves: <URL-of-the-bug>” to the commit message, too. Gitlab can
close bugs automatically once commits with the “Resolved:” keyword get
merged into the master branch of the project. And if your patch addresses
a bug in another public bug tracker, you can also use a line with
“Buglink: <URL-of-the-bug>” for reference here, too.

So I considered redhar BZ as a public bug tracker as well. Does the BZ
also automatically close bugs when we use "Resolves:"? Should we update
the instructions here?
--2088271309-591507682-1645104730=:294420--

