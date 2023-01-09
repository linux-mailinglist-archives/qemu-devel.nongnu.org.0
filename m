Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id ADC94662AAF
	for <lists+qemu-devel@lfdr.de>; Mon,  9 Jan 2023 16:59:45 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pEuYb-00062y-Sl; Mon, 09 Jan 2023 10:59:29 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@gmail.com>)
 id 1pEuYa-00062m-MD; Mon, 09 Jan 2023 10:59:28 -0500
Received: from mail-lj1-x22b.google.com ([2a00:1450:4864:20::22b])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@gmail.com>)
 id 1pEuYZ-0005XF-2j; Mon, 09 Jan 2023 10:59:28 -0500
Received: by mail-lj1-x22b.google.com with SMTP id q2so9306343ljp.6;
 Mon, 09 Jan 2023 07:59:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=ooFoxjkBJMHWKpG4WzM4ayARgpzmkfVql+sohPb1uM0=;
 b=gcfl0jnbzEY8oRYlghfyVk2AJ6Zu52nFPrBXPsuNxBLhE5WigGKrPUmbv3uOhLujE+
 e5rDMbtYCIbGe6IStXXnyhxCu9tCnvAp/RPP6tIIOJD7SyW/DmCA3hvQd2Fv+6Y3Syvl
 1bZBCSXiMGt7gdUpgH0lM5+WBADzRcPAsiZ/sP8ST1OBB2XCZx4XLBK1dI9a/VaZChoz
 fpW4aPl5sSNNJ2MRAfumZreFiWsQUHxM7sZ7HV0UnRNgreHZ7lPN+jRCIFi+PyyVkmE7
 aC0UI8cWj/9KfbwDBSH1T1iZEyQxohtOksVBz2DNKMA3BlCq+LTSR7D3KV9vTRer+Jxk
 z5kw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=ooFoxjkBJMHWKpG4WzM4ayARgpzmkfVql+sohPb1uM0=;
 b=7abClbwDhNzl5JVTv7LqujZ7av1tBsoB1Gnnqs31c0U40b2GLsn3G0r49noOJe4FfJ
 g35UMKIlpsy6rtcdaCvt1D+TU0g3V/NWDA+k7/R0nXqmZof/pYFZ0+kHqdl9lmmel2Cu
 ZyEvYl3Q+0eJtnUlLq/6RRtZVCq67OtD13AeGXK4Dh+n8QHdpSUTNG2r0k8Yb+5B2Sy4
 t+l05dcvJ6snyBrTuM9fiRO8EJdRbsqVBd+UMmOudyaWVvK27z3bXoetHVyS+18LoMsg
 YwgeoPXDyg1oCojIGWvEsSIaFucjF4ODvY8jocPN7TGEpBl9g/lpxgI89stLfK2/Fbcs
 E2+Q==
X-Gm-Message-State: AFqh2kqUEx82QQgX/PKMRfdDClmkOMG8bIYRdQt1HX9DesHDL/qgRv4n
 1TCaJVcv9rwy0hRZ58Ys8ETmksasdkG2ic56rcQ=
X-Google-Smtp-Source: AMrXdXspgyekZ3zqtEEUZSfYMcQX7uF1rcxigFvjNagugw8G0hhD7U2UAnHj3IPbKSpfYuNbqkpA9GinneJ0JiciOMs=
X-Received: by 2002:a2e:9586:0:b0:27f:e145:bffe with SMTP id
 w6-20020a2e9586000000b0027fe145bffemr2041374ljh.529.1673279964184; Mon, 09
 Jan 2023 07:59:24 -0800 (PST)
MIME-Version: 1.0
References: <20230109112110.128967-1-marcandre.lureau@redhat.com>
 <20230109112110.128967-2-marcandre.lureau@redhat.com>
 <0b04303a-20a6-d4fe-d9bc-0940e475d24b@redhat.com>
 <CAMxuvazQMf==JGTMMSEMZP30DNTTpZ3bVYB8EiKf1mSaJaM_vA@mail.gmail.com>
 <39362914-0c20-69b9-e213-8fdfb295fb9d@redhat.com>
In-Reply-To: <39362914-0c20-69b9-e213-8fdfb295fb9d@redhat.com>
From: =?UTF-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau@gmail.com>
Date: Mon, 9 Jan 2023 19:59:07 +0400
Message-ID: <CAJ+F1CJGrs624cik_SnEDWz=s1THWghyS78Zs=oEEXvKyVjHAQ@mail.gmail.com>
Subject: Re: [PATCH 1/2] build-sys: fix crlf-ending C code
To: Paolo Bonzini <pbonzini@redhat.com>
Cc: Thomas Huth <thuth@redhat.com>, qemu-devel@nongnu.org,
 Cleber Rosa <crosa@redhat.com>, 
 John Snow <jsnow@redhat.com>, Christian Borntraeger <borntraeger@linux.ibm.com>,
 David Hildenbrand <david@redhat.com>,
 =?UTF-8?Q?Daniel_P=2E_Berrang=C3=A9?= <berrange@redhat.com>, 
 Halil Pasic <pasic@linux.ibm.com>, Eric Farman <farman@linux.ibm.com>,
 kraxel@redhat.com, Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Cornelia Huck <cohuck@redhat.com>, 
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@linaro.org>, 
 Richard Henderson <richard.henderson@linaro.org>, qemu-s390x@nongnu.org, 
 =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>, 
 Beraldo Leal <bleal@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::22b;
 envelope-from=marcandre.lureau@gmail.com; helo=mail-lj1-x22b.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
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

Hi

On Mon, Jan 9, 2023 at 7:57 PM Paolo Bonzini <pbonzini@redhat.com> wrote:
>
> On 1/9/23 12:47, Marc-Andr=C3=A9 Lureau wrote:
> > Let's try that. A quick check reveals that configure already still has
> > perl usage. I will take a look.
>
> There's already a patch planned to remove it ("configure: remove
> backwards-compatibility code").

Ok, in the meantime, I replaced it with sed :)
The remaining one seems to be some sphinx workaround.

We'll need to update lcitool, my test CI branch is currently running from:

https://gitlab.com/marcandre.lureau/qemu/-/commits/test


--=20
Marc-Andr=C3=A9 Lureau

