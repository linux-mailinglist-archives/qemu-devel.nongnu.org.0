Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 23B6F64BDAA
	for <lists+qemu-devel@lfdr.de>; Tue, 13 Dec 2022 20:55:26 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p5BLQ-00023S-L0; Tue, 13 Dec 2022 14:53:40 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <nsoffer@redhat.com>)
 id 1p5BLK-00022L-Ph
 for qemu-devel@nongnu.org; Tue, 13 Dec 2022 14:53:36 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <nsoffer@redhat.com>)
 id 1p5BLJ-0001Am-5O
 for qemu-devel@nongnu.org; Tue, 13 Dec 2022 14:53:34 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1670961212;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Fa8+Qkakak+NayHv83cJDM+XRrhk7cOEcdBrJ3aKdwc=;
 b=MyB0ZbPpNjXmDnn4MGlOeIzQMplRmomAaNq3zbNf5fyi/GDXO/vsw0BC5rvv2hdCf7ndHF
 sf7MJY1WkA7evMbcndM66BtY1b1OV0jDZ6e+d5ADFGiu7uj38kbJkHoFJvCND3KIsWXoCe
 pJ69flJnE65YUL0VpXu/UQq37mMDCo4=
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com
 [209.85.160.199]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-93-UxyOdRkfOo22nkOPclEVUQ-1; Tue, 13 Dec 2022 14:53:30 -0500
X-MC-Unique: UxyOdRkfOo22nkOPclEVUQ-1
Received: by mail-qt1-f199.google.com with SMTP id
 fw8-20020a05622a4a8800b003a64f82fe73so666178qtb.3
 for <qemu-devel@nongnu.org>; Tue, 13 Dec 2022 11:53:30 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=Fa8+Qkakak+NayHv83cJDM+XRrhk7cOEcdBrJ3aKdwc=;
 b=Fk0YALv3E6JZ+BUSgQlycCc90XayKamzmNYSB2ovtoIDjV8ktKfFer9/RNmpYd9TLE
 G+X/MNsGy2kRGlflZv5nCwnCGKTuKWz/6iCGIrWAdoIfKCd1r9wqyJMgXiAi7XjIXDGf
 ZKtV8KYdBl7PAcz08eGk/uUb9T6wnYQQl6EVZs8w8B7KMsbEotLu7nYYTnDItNWOgWF2
 +DtKynRapDtLfo7MSUrrf0YgcgWCBRpMCEicSP1vrEqOovJ/VUTwaCtxjWFHfv4U6+Lz
 S+v87sparZlK7b/A++dgGImUkr86/BV8E7c+L+vwtjmSDPzrheE0a7qsxgPZi+mNCg6l
 eKpA==
X-Gm-Message-State: ANoB5pl55wH6baLLnSOw/DdiNIz+9YOGE4SuXA9CAOH1VtQl4g86JuQL
 xPf5jvzOMzP0QVeEU1onRtUNKuDllEGqIM6Eb9KEJpxSuzNNYXm8xNnGQwzZLhAgn9M/cBJAMQi
 axkGajAxhbRxr2f1+av+RxKCHkozZ2gw=
X-Received: by 2002:a05:620a:1410:b0:6fe:d640:e978 with SMTP id
 d16-20020a05620a141000b006fed640e978mr9324845qkj.296.1670961210197; 
 Tue, 13 Dec 2022 11:53:30 -0800 (PST)
X-Google-Smtp-Source: AA0mqf4Xg/oStctFiR8D5GOzGvaHfZUB/bcbFdTV8+nYXtIIRrdgJZdd0InUL+nSMb9wzfWSp/7nIJ/bfgzwocaxvcg=
X-Received: by 2002:a05:620a:1410:b0:6fe:d640:e978 with SMTP id
 d16-20020a05620a141000b006fed640e978mr9324836qkj.296.1670961209903; Tue, 13
 Dec 2022 11:53:29 -0800 (PST)
MIME-Version: 1.0
References: <20221128141514.388724-1-nsoffer@redhat.com>
 <20221128141514.388724-3-nsoffer@redhat.com>
 <a5923263-befe-30a4-afa2-a80ecb6b1ad2@redhat.com>
 <CAMRbyyvG4s2c96xy=SNmFv26zG2nwMDH+Da71L_QQ1HjJ6zs5Q@mail.gmail.com>
 <49a41e54-54df-5716-083b-e6a48922649b@redhat.com>
In-Reply-To: <49a41e54-54df-5716-083b-e6a48922649b@redhat.com>
From: Nir Soffer <nsoffer@redhat.com>
Date: Tue, 13 Dec 2022 21:53:13 +0200
Message-ID: <CAMRbyytw68Hz3uW4OguurgHSARKNQ9aCVX3nhEGmcRNEtO=hpQ@mail.gmail.com>
Subject: Re: [PATCH v2 2/5] Support format or cache specific out file
To: Hanna Reitz <hreitz@redhat.com>
Cc: qemu-devel@nongnu.org, Thomas Huth <thuth@redhat.com>, 
 Paolo Bonzini <pbonzini@redhat.com>, Kevin Wolf <kwolf@redhat.com>, 
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@linaro.org>, 
 =?UTF-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau@redhat.com>, 
 qemu-block@nongnu.org,
 =?UTF-8?Q?Daniel_P=2E_Berrang=C3=A9?= <berrange@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=170.10.129.124; envelope-from=nsoffer@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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

On Tue, Dec 13, 2022 at 8:09 PM Hanna Reitz <hreitz@redhat.com> wrote:
>
> On 13.12.22 16:56, Nir Soffer wrote:
> > On Mon, Dec 12, 2022 at 12:38 PM Hanna Reitz <hreitz@redhat.com> wrote:
> >> On 28.11.22 15:15, Nir Soffer wrote:
> >>> Extend the test finder to find tests with format (*.out.qcow2) or cac=
he
> >>> specific (*.out.nocache) out file. This worked before only for the
> >>> numbered tests.
> >>> ---
> >>>    tests/qemu-iotests/findtests.py | 10 ++++++++--
> >>>    1 file changed, 8 insertions(+), 2 deletions(-)
> >> This patch lacks an S-o-b, too.
> >>
> >>> diff --git a/tests/qemu-iotests/findtests.py b/tests/qemu-iotests/fin=
dtests.py
> >>> index dd77b453b8..f4344ce78c 100644
> >>> --- a/tests/qemu-iotests/findtests.py
> >>> +++ b/tests/qemu-iotests/findtests.py
> >>> @@ -38,31 +38,37 @@ def chdir(path: Optional[str] =3D None) -> Iterat=
or[None]:
> >>>            os.chdir(saved_dir)
> >>>
> >>>
> >>>    class TestFinder:
> >>>        def __init__(self, test_dir: Optional[str] =3D None) -> None:
> >>>            self.groups =3D defaultdict(set)
> >>>
> >>>            with chdir(test_dir):
> >>>                self.all_tests =3D glob.glob('[0-9][0-9][0-9]')
> >>>                self.all_tests +=3D [f for f in glob.iglob('tests/*')
> >>> -                               if not f.endswith('.out') and
> >>> -                               os.path.isfile(f + '.out')]
> >>> +                               if self.is_test(f)]
> >> So previously a file was only considered a test file if there was a
> >> corresponding reference output file (`f + '.out'`), so files without
> >> such a reference output aren=E2=80=99t considered test files...
> >>
> >>>                for t in self.all_tests:
> >>>                    with open(t, encoding=3D"utf-8") as f:
> >>>                        for line in f:
> >>>                            if line.startswith('# group: '):
> >>>                                for g in line.split()[2:]:
> >>>                                    self.groups[g].add(t)
> >>>                                break
> >>>
> >>> +    def is_test(self, fname: str) -> bool:
> >>> +        """
> >>> +        The tests directory contains tests (no extension) and out fi=
les
> >>> +        (*.out, *.out.{format}, *.out.{option}).
> >>> +        """
> >>> +        return re.search(r'.+\.out(\.\w+)?$', fname) is None
> >> ...but this new function doesn=E2=80=99t check that.  I think we shoul=
d check it
> >> (just whether there=E2=80=99s any variant of `/{fname}\.out(\.\w+)?/` =
to go with
> >> `fname`) so that behavior isn=E2=80=99t changed.
> > This means that you cannot add a test without a *.out* file, which may
> >   be useful when you don't use the out file for validation, but we can
> > add this later if needed.
>
> I don=E2=80=99t think tests work without a reference output, do they?  At=
 least
> a couple of years ago, the ./check script would refuse to run tests
> without a corresponding .out file.

This may be true, but most tests do not really need an out file and better =
be
verified by asserting. There are some python tests that have pointless out
file with the output of python unittest:

    $ cat tests/qemu-iotests/tests/nbd-multiconn.out
    ...
    ----------------------------------------------------------------------
    Ran 3 tests

    OK

This is not only unhelpful (update the output when adding a 4th test)
but fragile.
if unitests changes the output, maybe adding info about skipped tests, or
changing "---" to "****", the test will break.

But for now I agree the test framework should keep the current behavior.

Nir


