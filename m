Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E3B8B45EDE1
	for <lists+qemu-devel@lfdr.de>; Fri, 26 Nov 2021 13:29:44 +0100 (CET)
Received: from localhost ([::1]:33252 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mqaMJ-0001Jh-G8
	for lists+qemu-devel@lfdr.de; Fri, 26 Nov 2021 07:29:43 -0500
Received: from eggs.gnu.org ([209.51.188.92]:39780)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1mqaKQ-0007nV-2b
 for qemu-devel@nongnu.org; Fri, 26 Nov 2021 07:27:46 -0500
Received: from [2a00:1450:4864:20::52e] (port=42903
 helo=mail-ed1-x52e.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1mqaKO-00054K-Fw
 for qemu-devel@nongnu.org; Fri, 26 Nov 2021 07:27:45 -0500
Received: by mail-ed1-x52e.google.com with SMTP id r11so38277152edd.9
 for <qemu-devel@nongnu.org>; Fri, 26 Nov 2021 04:27:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=references:user-agent:from:to:cc:subject:date:in-reply-to
 :message-id:mime-version:content-transfer-encoding;
 bh=yZIiYiZCO3wIosKvYOOmg8DDP8r7/tr3b1n38/cwsQU=;
 b=dXE2u550Hd+0HWLBkkqcWZQwrCzFUloMuLLhcATSkDN9JfZxp3aCnOzFYv2AzYgRhe
 kWj8TJCWYTQ4weuE/+0LztedY4+UUK9JYD6pUUDIfPhQ2XrmAioabfXuaPuWJtkw3+/S
 TaIxPsolRjFS8C/pnX1bkeFfjtFtTeSUoXr/BBZazKYHCpC8Uwg492wLkbGAXd4wbyoM
 J73j+jKvNuASXpnVwcDmqJJH4arP1N+N5nP+DDtAMfJLGAF5z8cMhypwXYtIRFs6FUj5
 9NWBZ2ZNyawIk5A4tm09N8Xt2Rg1LWaCTH1wuTic/ITbZDuPdczNeE//0mOW9gHg7wMH
 7ofg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:references:user-agent:from:to:cc:subject:date
 :in-reply-to:message-id:mime-version:content-transfer-encoding;
 bh=yZIiYiZCO3wIosKvYOOmg8DDP8r7/tr3b1n38/cwsQU=;
 b=MYaEKZBX7UIQz6cJsObYqt927X+MSjyk452789pG2wyjdnWOKQLXAoqkdHngLWvVN2
 nLmZoTpadJM2ljHebGSG9zQVFqbRC1P10GNDKw7OUk3cxZfvy541Mbtjnmmf9MuER7A/
 +4ri2/pBrylB0B1lxqIJVr/sbn2ysPxL9TV3/T2hQAkKc7Too9qAOXpFjX8lKmk+8aYc
 LEuzTPW3piFSPxay1EZbhwZ2XyI44P+zbLV5jSh23YsYCQ582wKbe3KgbF6AkzWilPWZ
 63k0hstla6Vv5FCoVwb3jPI1aDZg0IezOPbsK33wBtnn/XWe8JH42hYANE7InMPKCBCh
 TfUA==
X-Gm-Message-State: AOAM533mCp/cfsSkejgE8S1qeQ1Jq+ElFvaa7Bt3ln7ovt59SQpNI3Ho
 sqUHbWRUJlFpuuWcLmd1bcIr2Q==
X-Google-Smtp-Source: ABdhPJzMmuZ5eoVkwytFhknRMndiZD9VjMfWT/DJwe3V1gCZDkzWmBgL5Kx1+qMSB1JspcScr74Bgg==
X-Received: by 2002:a17:907:e86:: with SMTP id
 ho6mr37371388ejc.197.1637929662602; 
 Fri, 26 Nov 2021 04:27:42 -0800 (PST)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id r13sm3695407edo.71.2021.11.26.04.27.41
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 26 Nov 2021 04:27:41 -0800 (PST)
Received: from zen (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 455361FF96;
 Fri, 26 Nov 2021 12:27:40 +0000 (GMT)
References: <OF255704A1.78FEF164-ON0025878E.00821084-0025878F.00015560@ibm.com>
 <20211117165719.pqig62t5z2grgjvv@intel.com>
 <20211117173201.00002513@Huawei.com>
 <OF164E5BA6.E927FE73-ON00258791.0078E206-88258791.007ABBAD@ibm.com>
 <BY5PR12MB4179A47F68A9A15E5888D074E89B9@BY5PR12MB4179.namprd12.prod.outlook.com>
 <20211119014822.j247ayrsdve4yxyu@intel.com>
 <BY5PR12MB4179AA1B062AEA75098E15D8E89C9@BY5PR12MB4179.namprd12.prod.outlook.com>
 <20211119032541.gr6berwu2ve4tkax@intel.com>
User-agent: mu4e 1.7.5; emacs 28.0.60
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Ben Widawsky <ben.widawsky@intel.com>
Subject: Re: Follow-up on the CXL discussion at OFTC
Date: Fri, 26 Nov 2021 12:08:08 +0000
In-reply-to: <20211119032541.gr6berwu2ve4tkax@intel.com>
Message-ID: <8735njf6f7.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::52e
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::52e;
 envelope-from=alex.bennee@linaro.org; helo=mail-ed1-x52e.google.com
X-Spam_score_int: -12
X-Spam_score: -1.3
X-Spam_bar: -
X-Spam_report: (-1.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 PDS_HP_HELO_NORDNS=0.001, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: Peter Maydell <peter.maydell@linaro.org>, qemu-devel@nongnu.org,
 Saransh Gupta1 <saransh@ibm.com>,
 Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Shreyas Shah <shreyas.shah@elastics.cloud>,
 "linux-cxl@vger.kernel.org" <linux-cxl@vger.kernel.org>,
 Jonathan Cameron <Jonathan.Cameron@huawei.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


Ben Widawsky <ben.widawsky@intel.com> writes:

> On 21-11-19 02:29:51, Shreyas Shah wrote:
>> Hi Ben
>>=20
>> Are you planning to add the CXL2.0 switch inside QEMU or already added i=
n one of the version?=20
>>=20=20
>
> From me, there are no plans for QEMU anything until/unless upstream think=
s it
> will merge the existing patches, or provide feedback as to what it would =
take to
> get them merged. If upstream doesn't see a point in these patches, then I=
 really
> don't see much value in continuing to further them. Once hardware comes o=
ut, the
> value proposition is certainly less.

I take it:

  Subject: [RFC PATCH v3 00/31] CXL 2.0 Support
  Date: Mon,  1 Feb 2021 16:59:17 -0800
  Message-Id: <20210202005948.241655-1-ben.widawsky@intel.com>

is the current state of the support? I saw there was a fair amount of
discussion on the thread so assumed there would be a v4 forthcoming at
some point.

Adding new subsystems to QEMU does seem to be a pain point for new
contributors. Patches tend to fall through the cracks of existing
maintainers who spend most of their time looking at stuff that directly
touches their files. There is also a reluctance to merge large chunks of
functionality without an identified maintainer (and maybe reviewers) who
can be the contact point for new patches. So in short you need:

 - Maintainer Reviewed-by/Acked-by on patches that touch other sub-systems
 - Reviewed-by tags on the new sub-system patches from anyone who understan=
ds CXL
 - Some* in-tree testing (so it doesn't quietly bitrot)
 - A patch adding the sub-system to MAINTAINERS with identified people

* Some means at least ensuring qtest can instantiate the device and not
  fall over. Obviously more testing is better but it can always be
  expanded on in later series.

Is that the feedback you were looking for?

--=20
Alex Benn=C3=A9e

