Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 50686662F1E
	for <lists+qemu-devel@lfdr.de>; Mon,  9 Jan 2023 19:31:58 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pEwvT-0006wv-Id; Mon, 09 Jan 2023 13:31:15 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@gmail.com>)
 id 1pEwvR-0006wP-N9; Mon, 09 Jan 2023 13:31:13 -0500
Received: from mail-lf1-x132.google.com ([2a00:1450:4864:20::132])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@gmail.com>)
 id 1pEwvP-000639-1Q; Mon, 09 Jan 2023 13:31:13 -0500
Received: by mail-lf1-x132.google.com with SMTP id bt23so14323363lfb.5;
 Mon, 09 Jan 2023 10:31:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=fA9yG7KQ7DIccdcg3JB3e0LqIY84YMhFyaVkHRvb4J8=;
 b=CLlHKtzARntHVdmrECpiQHeGezs5h9d/Y/eAcraUNhHxsyg8IsL2VBppnNIgA0uhec
 Tjqkha4FWheCZ+qNMMJJqQxe2TrqS9ow59N5HlRlPYxeKZp8C0boMNGV+mmtm/QevuRE
 bTJeoul4HHJY2lhCoZBayg5HdXzQHJD6jmdr6iJnqeU4UBNWKrtIZHKjfcdK/SGyhpyq
 vgSo/1s+1e/c1dSh9AvY8OzmMCrUgDHGrZVMFpJmjCeuPn0I9swqDjHYCGodV+dW3X3c
 qh2wEZwH2vZWRJDS7HwAy2xwh/IikAUtWLWNeAOVG4xvocF49myWBq6MUDECS0a/iSDV
 +GCQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=fA9yG7KQ7DIccdcg3JB3e0LqIY84YMhFyaVkHRvb4J8=;
 b=zdTnwHTKga8CbxhK7kI1cY6ZAWqghEcaDS7AdiJkoNyoCYYgsGSbfzVtQjb8ISoIVd
 FdtBH7Zejd8/7dgASHDmiBXI2AOLsJdi2sjlp4IKzzz3NYGWcOL9hCXXeyvnwXXzBR/x
 hgNpct9TUmzBw5RDpLZe4qmtwS48iYuMqYtCyjLsnuEbYxtMO86prFRMP0nYXSUlcnUi
 7nmJDwfydgDywqn4vtuXU5mY03495+uvplqvq9hhAMZBbqMGYUjH9JS+ldHM7zGB6BQ6
 wY/oQ7JHYmnYRFQswnC/5LDM6sBKvDFvdk4Naa8gcmC6yKLHfVZU0E2OUxPdnSJMC4kD
 Y3cg==
X-Gm-Message-State: AFqh2krz7mEaBhl1TZ1GtaBkKZXLwOaO0zWa4eHg+ZJ+ALYi03rcf3OJ
 0zFdCEZVNkZAzcZCo31IPyBC48edRD6LZmc849s=
X-Google-Smtp-Source: AMrXdXsAyPz3SmEnNVkS1rmf7M+MKGu6tTBbNXqcOgyZA7lu/IMBfCjjcz9ie8sgRFSJ01xhwOzS+ugsb/KMjZa1cQI=
X-Received: by 2002:a05:6512:169d:b0:4cb:269:dfed with SMTP id
 bu29-20020a056512169d00b004cb0269dfedmr4344616lfb.329.1673289069013; Mon, 09
 Jan 2023 10:31:09 -0800 (PST)
MIME-Version: 1.0
References: <20230109181447.235989-1-marcandre.lureau@redhat.com>
 <20230109181447.235989-6-marcandre.lureau@redhat.com>
 <Y7xcl38xQ6vxbRKW@redhat.com>
In-Reply-To: <Y7xcl38xQ6vxbRKW@redhat.com>
From: =?UTF-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau@gmail.com>
Date: Mon, 9 Jan 2023 22:30:56 +0400
Message-ID: <CAJ+F1CKyahyCqAu5Ob0VBqHLjuEosY9omwykiVjh6Pi1My7ASA@mail.gmail.com>
Subject: Re: [PATCH v2 5/5] Draft: Update lcitool
To: =?UTF-8?Q?Daniel_P=2E_Berrang=C3=A9?= <berrange@redhat.com>
Cc: qemu-devel@nongnu.org,
 =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>, 
 Markus Armbruster <armbru@redhat.com>, Ed Maste <emaste@freebsd.org>, 
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@linaro.org>, 
 Paolo Bonzini <pbonzini@redhat.com>, Cornelia Huck <cohuck@redhat.com>, 
 Eric Farman <farman@linux.ibm.com>, John Snow <jsnow@redhat.com>, 
 Halil Pasic <pasic@linux.ibm.com>,
 Christian Borntraeger <borntraeger@linux.ibm.com>, 
 Thomas Huth <thuth@redhat.com>, Cleber Rosa <crosa@redhat.com>,
 Beraldo Leal <bleal@redhat.com>, 
 Li-Wen Hsu <lwhsu@freebsd.org>, David Hildenbrand <david@redhat.com>,
 kraxel@redhat.com, 
 Richard Henderson <richard.henderson@linaro.org>, qemu-s390x@nongnu.org, 
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Michael Roth <michael.roth@amd.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::132;
 envelope-from=marcandre.lureau@gmail.com; helo=mail-lf1-x132.google.com
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

On Mon, Jan 9, 2023 at 10:28 PM Daniel P. Berrang=C3=A9 <berrange@redhat.co=
m> wrote:
>
> On Mon, Jan 09, 2023 at 10:14:47PM +0400, marcandre.lureau@redhat.com wro=
te:
> > From: Marc-Andr=C3=A9 Lureau <marcandre.lureau@redhat.com>
> >
> > - Update to fedora-37
> > - Drop perl
> >
> > Note: see https://gitlab.com/libvirt/libvirt-ci/-/merge_requests/344 me=
rge
> > status before merging with proper submodule sha1.
>
> There is no need to wait for that change. We don't use the qemu.yml
> file in lcitool.git, and it should be ignored. The one you changed
> in qemu.git is the canonical one
>

Ok, in that case we don't need to bump to fedora-37 either.

I'll drop the lcitool update, as I don't have a reason to do it now.



--=20
Marc-Andr=C3=A9 Lureau

