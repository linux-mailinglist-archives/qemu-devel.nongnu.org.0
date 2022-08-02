Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 47C0E588307
	for <lists+qemu-devel@lfdr.de>; Tue,  2 Aug 2022 22:15:05 +0200 (CEST)
Received: from localhost ([::1]:60538 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oIyIB-0003QI-UM
	for lists+qemu-devel@lfdr.de; Tue, 02 Aug 2022 16:15:03 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58304)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@gmail.com>)
 id 1oIyGl-0001sO-KZ
 for qemu-devel@nongnu.org; Tue, 02 Aug 2022 16:13:35 -0400
Received: from mail-yw1-x112c.google.com ([2607:f8b0:4864:20::112c]:46009)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <stefanha@gmail.com>)
 id 1oIyGk-0004jh-67
 for qemu-devel@nongnu.org; Tue, 02 Aug 2022 16:13:35 -0400
Received: by mail-yw1-x112c.google.com with SMTP id
 00721157ae682-3246910dac3so100177597b3.12
 for <qemu-devel@nongnu.org>; Tue, 02 Aug 2022 13:13:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc;
 bh=AQRbwInugy0+qajExhCaoerl/VlUFJeagrlhzoa3fHg=;
 b=F7bhfevcRizGJoJ+krgBTvDYJ7rCLqEuADKw7EtZXOjWVNMLYheWSO4ZHSRG8tSJ4v
 jtNTqBu5jSZfMjsmgqIbb53JSxuAL2lIlxGbjVYuJ0VjKJ9KqUwuWpRHYk5KdQAKyTGr
 7aQEoV/1LpeQzANcd4bEvffHfcLy2dJbsNZ6TLlMwbqqIE+xn1YME/BvNVBBV9avrsXE
 IPe0cXsnFA9UuQnlUdDG02969ScPXqpHzAjGXfPu09jQSQXWTaAkwhBct2rN6VB2LJHC
 pYX/esA5msu1UInXhGFKtuGX7s3Jd5YId+ZTUBxOGp07fps6SSHc9CXFfEzWP0A3k6fg
 OzYA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc;
 bh=AQRbwInugy0+qajExhCaoerl/VlUFJeagrlhzoa3fHg=;
 b=h6T9ULP/Y4erthdU1zqkZ8cZr2HNVZ90L54Rrh+WB+Pn5VWbJzaomyZq3Jj5wNs68l
 BLK64fzc4AFEtblSEYW759dDon9JGpOaILGbt3vwLFR0LvezZ1ZjCyF2kln9lTgklyKC
 k+T3dILhczWyIN1PhIE1ygvWHZE9JIadpC6fdFpqaDx6sT6ZJBgW+ks1lxF8Ex1F5/L6
 aWc5L2QgAUPbzLpJfoh3/pBkoDzOGIpGMj4MJY4FA+ifhuTtYho/kUVR+aXmOIo0fnZ7
 U9QTpq0PQHAXtv23zCT2Ywj+c633uXIjf+TxkibRRrN72Pf4CF7o2AvL0Gl9fJAdarcf
 Yl4Q==
X-Gm-Message-State: ACgBeo1QdHQJsgMferW/mab6EPEYR//ukD5eTPx2zCVAzQVQToZCG4u2
 /2vDYIvuuMNONkW8dXE/3E1POJiAWUg/EId2tik=
X-Google-Smtp-Source: AA6agR4cjzIMCJXwrwbeERLSPXW8OlwVj+M2B9mV1eetwlctODTc98Rb47usINofgRDjbDRjq/XFrIilGwDAZPp6NQ8=
X-Received: by 2002:a81:8746:0:b0:31d:c5a6:ad8f with SMTP id
 x67-20020a818746000000b0031dc5a6ad8fmr19973314ywf.206.1659471213001; Tue, 02
 Aug 2022 13:13:33 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1659403195.git.jag.raman@oracle.com>
 <6b9dc37842ea533622c09d0ca7462f77c18cd67d.1659403195.git.jag.raman@oracle.com>
 <Yujx8ZlUIAO0eQ24@redhat.com>
In-Reply-To: <Yujx8ZlUIAO0eQ24@redhat.com>
From: Stefan Hajnoczi <stefanha@gmail.com>
Date: Tue, 2 Aug 2022 16:13:21 -0400
Message-ID: <CAJSP0QXbgJ_n=hpM7zx03L6qyDRrVSPMFGbxN6sJJCD9XmfA5w@mail.gmail.com>
Subject: Re: [PATCH 1/1] vfio-user: update submodule to latest
To: =?UTF-8?Q?Daniel_P=2E_Berrang=C3=A9?= <berrange@redhat.com>, 
 Richard Henderson <richard.henderson@linaro.org>
Cc: Jagannathan Raman <jag.raman@oracle.com>,
 qemu-devel <qemu-devel@nongnu.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2607:f8b0:4864:20::112c;
 envelope-from=stefanha@gmail.com; helo=mail-yw1-x112c.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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

On Tue, 2 Aug 2022 at 05:44, Daniel P. Berrang=C3=A9 <berrange@redhat.com> =
wrote:
> On Mon, Aug 01, 2022 at 09:24:04PM -0400, Jagannathan Raman wrote:
> > Update libvfio-user submodule to the latest
> >
> > Signed-off-by: Jagannathan Raman <jag.raman@oracle.com>
> > ---
> >  subprojects/libvfio-user | 2 +-
> >  1 file changed, 1 insertion(+), 1 deletion(-)
> >
> > diff --git a/subprojects/libvfio-user b/subprojects/libvfio-user
> > index 0b28d20557..1305f161b7 160000
> > --- a/subprojects/libvfio-user
> > +++ b/subprojects/libvfio-user
> > @@ -1 +1 @@
> > -Subproject commit 0b28d205572c80b568a1003db2c8f37ca333e4d7
> > +Subproject commit 1305f161b7e0dd2c2a420c17efcb0bd49b94dad4
>
> Only 3 changes in the submodule with this:
>
> 1305f161b7e0dd2c2a420c17efcb0bd49b94dad4 disable client-server test by de=
fault (#700)
> 36beb63be45ad1412562a98d9373a4c0bd91ab3d support for shadow ioeventfd (#6=
98)
> 1c274027bb4f9d68eee846036e8d50dcde2fd7e9 improve README.md (#696)
>
> That fixes the testing bug we see, the other change affects an API that
> QEMU doesn't use. Overall looks safe for applying during soft freeze.
>
> Reviewed-by: Daniel P. Berrang=C3=A9 <berrange@redhat.com>

CCing Richard so this can be merged.

Stefan

