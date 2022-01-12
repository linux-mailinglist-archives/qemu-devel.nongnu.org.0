Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 634F648BC55
	for <lists+qemu-devel@lfdr.de>; Wed, 12 Jan 2022 02:19:26 +0100 (CET)
Received: from localhost ([::1]:42952 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n7SIP-0002ay-HM
	for lists+qemu-devel@lfdr.de; Tue, 11 Jan 2022 20:19:25 -0500
Received: from eggs.gnu.org ([209.51.188.92]:36938)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1n7Reu-00027Z-47
 for qemu-devel@nongnu.org; Tue, 11 Jan 2022 19:38:40 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:44896)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1n7Rec-0005mk-AW
 for qemu-devel@nongnu.org; Tue, 11 Jan 2022 19:38:32 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1641947895;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=BDVm3neMlpPyZQMJN6llauok2IKpUgVUHXs9EVz2bgM=;
 b=Dhl0OK5VwQ+TeNAIMFm1CIsr7HjpsAi6v2AQBTysK47z2NefWQbRED/4q6i1tJVigv0OPU
 ZyXuTcqsxLSLIQb/FoI42g8JulJIBfH7ND+WX03eJMuj3hijH4Mwovyiurc5PfbvQCQRFh
 bWZMeJzs4UnPvl+zTxu/czcXGqp1B2s=
Received: from mail-ua1-f72.google.com (mail-ua1-f72.google.com
 [209.85.222.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-408-SxtaKC6VMjKj7IsAOmZaRQ-1; Tue, 11 Jan 2022 19:38:14 -0500
X-MC-Unique: SxtaKC6VMjKj7IsAOmZaRQ-1
Received: by mail-ua1-f72.google.com with SMTP id
 x9-20020ab05789000000b002fa60bdf012so614078uaa.1
 for <qemu-devel@nongnu.org>; Tue, 11 Jan 2022 16:38:14 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=BDVm3neMlpPyZQMJN6llauok2IKpUgVUHXs9EVz2bgM=;
 b=d5ntdxJYUsovPjpUS01RtaNujCrNu3vM8dpsNgDpgUnPZNWWLAlZzM+mUtUTuW2Osv
 AWyR/tfq0yrOSXBvtYkQICn7MYs+mbG9piCZOAYqfQ5MHIBuwEHbut1E3Yd6vik2skPu
 3uWmEJPuhiNqJ6tRP/cOsV6J1O2N4TlBMD2lmls2b2djZyZ7Y1OmwNAhjRqU3XNsngEk
 ECpYrZlf7be9VfM9uXjz3Xw7crrW5zJxGjHgbCCgaJ85EOKM1g8VYXZg1cSgzdHNyHs9
 r175V/EIytnsEUSES+0iRiZvFpzXnfMTx5vtz/p96eu3NLqpCxzbQ/3iLNlm/ed2R1JQ
 PP6Q==
X-Gm-Message-State: AOAM530KnRjzl+8kBEtrAKH7A+p2+72cHeB1oXjP8snuMiqCpghZUWoA
 KjJBYizXNeX7yykeQ4wJmSbqx3yr+I7bfMw11HAIhuQlXIhRO+HJFQNKld8Gti4W/W1OLG5iAaa
 6Wy50lJgShVa3w81LTEQXSXu5BIZe7d8=
X-Received: by 2002:a05:6102:3714:: with SMTP id
 s20mr2999782vst.61.1641947894236; 
 Tue, 11 Jan 2022 16:38:14 -0800 (PST)
X-Google-Smtp-Source: ABdhPJwBFE72ieHDrfMBkmT4GPCZupYMDP4Rf2RJmDvHKxp4+oGo5LgFPlDVwzsW7ZkSwq9m5cGRhHQr8TkyNPy2FRU=
X-Received: by 2002:a05:6102:3714:: with SMTP id
 s20mr2999767vst.61.1641947893974; 
 Tue, 11 Jan 2022 16:38:13 -0800 (PST)
MIME-Version: 1.0
References: <20211223110756.699148-1-vsementsov@virtuozzo.com>
 <20211223110756.699148-4-vsementsov@virtuozzo.com>
In-Reply-To: <20211223110756.699148-4-vsementsov@virtuozzo.com>
From: John Snow <jsnow@redhat.com>
Date: Tue, 11 Jan 2022 19:38:03 -0500
Message-ID: <CAFn=p-Z-cVy1C+Q2v4dPN4gLFdciUZv5G5BZDELEpCT89tiwTA@mail.gmail.com>
Subject: Re: [PATCH v2 3/4] scripts/qapi-gen.py: add --add-trace-points option
To: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=jsnow@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=170.10.133.124; envelope-from=jsnow@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -33
X-Spam_score: -3.4
X-Spam_bar: ---
X-Spam_report: (-3.4 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.595,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Kevin Wolf <kwolf@redhat.com>, Qemu-block <qemu-block@nongnu.org>,
 Michael Roth <michael.roth@amd.com>, qemu-devel <qemu-devel@nongnu.org>,
 Markus Armbruster <armbru@redhat.com>, Hanna Reitz <hreitz@redhat.com>,
 Stefan Hajnoczi <stefanha@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Philippe Mathieu Daude <philmd@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Thu, Dec 23, 2021 at 6:08 AM Vladimir Sementsov-Ogievskiy
<vsementsov@virtuozzo.com> wrote:
>
> Add and option to generate trace points. We should generate both trace
> points and trace-events files for further trace point code generation.
>
> Signed-off-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
> Reviewed-by: Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com>
> ---
>  scripts/qapi/gen.py  | 13 ++++++++++---
>  scripts/qapi/main.py | 10 +++++++---
>  2 files changed, 17 insertions(+), 6 deletions(-)
>
> diff --git a/scripts/qapi/gen.py b/scripts/qapi/gen.py
> index 995a97d2b8..605b3fe68a 100644
> --- a/scripts/qapi/gen.py
> +++ b/scripts/qapi/gen.py
> @@ -251,7 +251,7 @@ def __init__(self,
>          self._builtin_blurb =3D builtin_blurb
>          self._pydoc =3D pydoc
>          self._current_module: Optional[str] =3D None
> -        self._module: Dict[str, Tuple[QAPIGenC, QAPIGenH]] =3D {}
> +        self._module: Dict[str, Tuple[QAPIGenC, QAPIGenH, QAPIGen]] =3D =
{}
>          self._main_module: Optional[str] =3D None
>
>      @property
> @@ -264,6 +264,11 @@ def _genh(self) -> QAPIGenH:
>          assert self._current_module is not None
>          return self._module[self._current_module][1]
>
> +    @property
> +    def _gent(self) -> QAPIGen:
> +        assert self._current_module is not None
> +        return self._module[self._current_module][2]
> +
>      @staticmethod
>      def _module_dirname(name: str) -> str:
>          if QAPISchemaModule.is_user_module(name):
> @@ -293,7 +298,8 @@ def _add_module(self, name: str, blurb: str) -> None:
>          basename =3D self._module_filename(self._what, name)
>          genc =3D QAPIGenC(basename + '.c', blurb, self._pydoc)
>          genh =3D QAPIGenH(basename + '.h', blurb, self._pydoc)
> -        self._module[name] =3D (genc, genh)
> +        gent =3D QAPIGen(basename + '.trace-events')
> +        self._module[name] =3D (genc, genh, gent)
>          self._current_module =3D name
>
>      @contextmanager
> @@ -304,11 +310,12 @@ def _temp_module(self, name: str) -> Iterator[None]=
:
>          self._current_module =3D old_module
>
>      def write(self, output_dir: str, opt_builtins: bool =3D False) -> No=
ne:
> -        for name, (genc, genh) in self._module.items():
> +        for name, (genc, genh, gent) in self._module.items():
>              if QAPISchemaModule.is_builtin_module(name) and not opt_buil=
tins:
>                  continue
>              genc.write(output_dir)
>              genh.write(output_dir)
> +            gent.write(output_dir)
>
>      def _begin_builtin_module(self) -> None:
>          pass
> diff --git a/scripts/qapi/main.py b/scripts/qapi/main.py
> index f2ea6e0ce4..3adf0319cf 100644
> --- a/scripts/qapi/main.py
> +++ b/scripts/qapi/main.py
> @@ -32,7 +32,8 @@ def generate(schema_file: str,
>               output_dir: str,
>               prefix: str,
>               unmask: bool =3D False,
> -             builtins: bool =3D False) -> None:
> +             builtins: bool =3D False,
> +             add_trace_points: bool =3D False) -> None:
>      """
>      Generate C code for the given schema into the target directory.
>
> @@ -49,7 +50,7 @@ def generate(schema_file: str,
>      schema =3D QAPISchema(schema_file)
>      gen_types(schema, output_dir, prefix, builtins)
>      gen_visit(schema, output_dir, prefix, builtins)
> -    gen_commands(schema, output_dir, prefix)
> +    gen_commands(schema, output_dir, prefix, add_trace_points)
>      gen_events(schema, output_dir, prefix)
>      gen_introspect(schema, output_dir, prefix, unmask)
>
> @@ -74,6 +75,8 @@ def main() -> int:
>      parser.add_argument('-u', '--unmask-non-abi-names', action=3D'store_=
true',
>                          dest=3D'unmask',
>                          help=3D"expose non-ABI names in introspection")
> +    parser.add_argument('--add-trace-points', action=3D'store_true',
> +                        help=3D"add trace points to qmp marshals")

"Add trace events to generated marshaling functions." maybe?

>      parser.add_argument('schema', action=3D'store')
>      args =3D parser.parse_args()
>
> @@ -88,7 +91,8 @@ def main() -> int:
>                   output_dir=3Dargs.output_dir,
>                   prefix=3Dargs.prefix,
>                   unmask=3Dargs.unmask,
> -                 builtins=3Dargs.builtins)
> +                 builtins=3Dargs.builtins,
> +                 add_trace_points=3Dargs.add_trace_points)
>      except QAPIError as err:
>          print(f"{sys.argv[0]}: {str(err)}", file=3Dsys.stderr)
>          return 1
> --
> 2.31.1
>

I suppose the flag is so that non-QEMU invocations of the QAPI
generator (for tests, etc) will compile correctly without tracepoint
definitions, yeah?


