Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6C7394964AD
	for <lists+qemu-devel@lfdr.de>; Fri, 21 Jan 2022 18:59:05 +0100 (CET)
Received: from localhost ([::1]:43024 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nAyBk-0000Zc-Ik
	for lists+qemu-devel@lfdr.de; Fri, 21 Jan 2022 12:59:04 -0500
Received: from eggs.gnu.org ([209.51.188.92]:51728)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1nAy9u-0006wi-5h
 for qemu-devel@nongnu.org; Fri, 21 Jan 2022 12:57:10 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:27807)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1nAy9o-0003J1-3S
 for qemu-devel@nongnu.org; Fri, 21 Jan 2022 12:57:05 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1642787821;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=4t9nUVX3FwoDuF6Eb3OGJEUpJpQikF1aWLU6SDmOMTE=;
 b=MqEM51H7yfB9EXDJsjmPsZiA1KxFR6ApUBs77mIFYyH0rakeJMrpbvLJQUQBD514qYLCIS
 C/Q/aKzpXL4Y3Yi21lrTHrvY8/VawsRPDP5VaovCRoZqPDAY0A/9Sxq64eMi67nm0tTThE
 rUTWHx5PDMAmIlsCm0SN4vcQv8W0Y3s=
Received: from mail-ua1-f72.google.com (mail-ua1-f72.google.com
 [209.85.222.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-68-02rqCNzIMtSKuzOKkewD2A-1; Fri, 21 Jan 2022 12:56:14 -0500
X-MC-Unique: 02rqCNzIMtSKuzOKkewD2A-1
Received: by mail-ua1-f72.google.com with SMTP id
 i25-20020ab03759000000b00308e68dcb1fso5998077uat.22
 for <qemu-devel@nongnu.org>; Fri, 21 Jan 2022 09:56:14 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=4t9nUVX3FwoDuF6Eb3OGJEUpJpQikF1aWLU6SDmOMTE=;
 b=l8cmeWfjTP314hoLFP85v+vRFyK5pKCT1W1RX/WuTLDWGtnXmpYtDAKLoEY5qnmXJp
 ofPVJIXgrHuxiodJZTWyApQAgAgZOhyavcL4zFfPDF8Y08erGn9z1ijRT4nd5dl7xRKJ
 pxHxbY4bkQjHxkgeg2V6lG1WKXtPM4b6/OoA4oD/r5piqXi6xDeo/CHqKaQoixWvBMPN
 NNTIx5Ksr7HVxoqGyzFYoRIVNzIAFxVgT6fb6L/d1I3Bl99jeh3Z2FvDZasEadnMWZe3
 X7otPLqdCRMHXZKGMwYEbf6QBNONNZ5HS/uSCdlA8YH+7E757sGeeASUwsQ5rbH7e9nW
 0T/A==
X-Gm-Message-State: AOAM531AiklBGQfGSuQn/9hKgRElv9Z+qM5qvP+UilmqqkpUIrA11AlU
 dSG7Vf7trxQHizU5VcjM8NoWOVBXTH5pWpj0n4GnKjWqfPledXHKrCcR1smrAWrZRMCEsari07h
 0DKMhxepkLdmiy9JbMXrbSg/bR89gla4=
X-Received: by 2002:a05:6102:3714:: with SMTP id
 s20mr2316831vst.61.1642787773614; 
 Fri, 21 Jan 2022 09:56:13 -0800 (PST)
X-Google-Smtp-Source: ABdhPJwDf5+DX+aQN4U2E6e3aPDoEz8+mTi/lomOXzQA2OPrMXcoQsUztrylKPDnCMtuQy97PYHsCVeTe9CFFOU2ov0=
X-Received: by 2002:a05:6102:3714:: with SMTP id
 s20mr2316815vst.61.1642787773294; 
 Fri, 21 Jan 2022 09:56:13 -0800 (PST)
MIME-Version: 1.0
References: <20220121162234.2707906-1-vsementsov@virtuozzo.com>
 <20220121162234.2707906-2-vsementsov@virtuozzo.com>
In-Reply-To: <20220121162234.2707906-2-vsementsov@virtuozzo.com>
From: John Snow <jsnow@redhat.com>
Date: Fri, 21 Jan 2022 12:56:02 -0500
Message-ID: <CAFn=p-b4BfZrzCYw0Ed5iWq+rOYfh8pSYjG98n3O42vY15f-hg@mail.gmail.com>
Subject: Re: [PATCH v4 1/3] scripts/qapi/gen.py: add FOO.trace-events output
 module
To: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=jsnow@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=170.10.133.124; envelope-from=jsnow@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.699,
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
Cc: Kevin Wolf <kwolf@redhat.com>, Michael Roth <michael.roth@amd.com>,
 qemu-devel <qemu-devel@nongnu.org>, Markus Armbruster <armbru@redhat.com>,
 Hanna Reitz <hreitz@redhat.com>, Stefan Hajnoczi <stefanha@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Fri, Jan 21, 2022 at 11:22 AM Vladimir Sementsov-Ogievskiy
<vsementsov@virtuozzo.com> wrote:
>
> We are going to generate trace events for qmp commands. We should
> generate both trace_*() function calls and trace-events files listing
> events for trace generator.
>
> So, add an output module FOO.trace-events for each FOO schema module.
>
> Still, we'll need these .trace-events files only for
> QAPISchemaGenCommandVisitor successor of QAPISchemaModularCVisitor.
> So, make this possibility optional, to avoid generating extra empty
> files for all other successors of QAPISchemaModularCVisitor.
>
> We can't simply add the new feature directly to
> QAPISchemaGenCommandVisitor: this means we'll have to reimplement
> a kind of ._module / .write() functionality of parent class in the
> successor, which seems worse than extending base class functionality.
>
> Currently nobody set add_trace_events to True, so new functionality is
> formally disabled. It will be enabled for QAPISchemaGenCommandVisitor
> in further commit.
>
> Signed-off-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
> ---
>  scripts/qapi/gen.py | 31 +++++++++++++++++++++++++++----
>  1 file changed, 27 insertions(+), 4 deletions(-)
>
> diff --git a/scripts/qapi/gen.py b/scripts/qapi/gen.py
> index 995a97d2b8..def52f021e 100644
> --- a/scripts/qapi/gen.py
> +++ b/scripts/qapi/gen.py
> @@ -192,6 +192,11 @@ def _bottom(self) -> str:
>          return guardend(self.fname)
>
>
> +class QAPIGenTrace(QAPIGen):
> +    def _top(self):

-> str:

> +        return super()._top() + '# AUTOMATICALLY GENERATED, DO NOT MODIFY\n\n'
> +
> +
>  @contextmanager
>  def ifcontext(ifcond: QAPISchemaIfCond, *args: QAPIGenCCode) -> Iterator[None]:
>      """
> @@ -244,15 +249,18 @@ def __init__(self,
>                   what: str,
>                   user_blurb: str,
>                   builtin_blurb: Optional[str],
> -                 pydoc: str):
> +                 pydoc: str,
> +                 add_trace_events: bool = False):
>          self._prefix = prefix
>          self._what = what
>          self._user_blurb = user_blurb
>          self._builtin_blurb = builtin_blurb
>          self._pydoc = pydoc
>          self._current_module: Optional[str] = None
> -        self._module: Dict[str, Tuple[QAPIGenC, QAPIGenH]] = {}
> +        self._module: Dict[str, Tuple[QAPIGenC, QAPIGenH,
> +                                      Optional[QAPIGenTrace]]] = {}
>          self._main_module: Optional[str] = None
> +        self.add_trace_events = add_trace_events
>
>      @property
>      def _genc(self) -> QAPIGenC:
> @@ -264,6 +272,14 @@ def _genh(self) -> QAPIGenH:
>          assert self._current_module is not None
>          return self._module[self._current_module][1]
>
> +    @property
> +    def _gent(self) -> QAPIGenTrace:
> +        assert self.add_trace_events
> +        assert self._current_module is not None
> +        gent = self._module[self._current_module][2]
> +        assert gent is not None
> +        return gent
> +
>      @staticmethod
>      def _module_dirname(name: str) -> str:
>          if QAPISchemaModule.is_user_module(name):
> @@ -293,7 +309,12 @@ def _add_module(self, name: str, blurb: str) -> None:
>          basename = self._module_filename(self._what, name)
>          genc = QAPIGenC(basename + '.c', blurb, self._pydoc)
>          genh = QAPIGenH(basename + '.h', blurb, self._pydoc)
> -        self._module[name] = (genc, genh)

gent: Optional[QAPIGenTrace]

> +        if self.add_trace_events:
> +            gent = QAPIGenTrace(basename + '.trace-events')
> +        else:
> +            gent = None
> +
> +        self._module[name] = (genc, genh, gent)
>          self._current_module = name
>
>      @contextmanager
> @@ -304,11 +325,13 @@ def _temp_module(self, name: str) -> Iterator[None]:
>          self._current_module = old_module
>
>      def write(self, output_dir: str, opt_builtins: bool = False) -> None:
> -        for name, (genc, genh) in self._module.items():
> +        for name, (genc, genh, gent) in self._module.items():
>              if QAPISchemaModule.is_builtin_module(name) and not opt_builtins:
>                  continue
>              genc.write(output_dir)
>              genh.write(output_dir)
> +            if gent is not None:
> +                gent.write(output_dir)
>
>      def _begin_builtin_module(self) -> None:
>          pass
> --
> 2.31.1
>

... Sorry, I didn't finish typing this module 100%, so the scripts
aren't in the tree yet. I'll have to resume that project soon, I am
just trying to juggle a lot of things simultaneously. forgive me!

but, these should work:

> cd ~/src/qemu/scripts
> mypy --config-file=qapi/mypy.ini qapi/
> flake8 --config=qapi/.flake8 qapi/

pylint and isort has had some small regressions, so don't worry about
those as much:

> pylint --rcfile=qapi/pylintrc qapi/
************* Module qapi.events
qapi/events.py:112:8: C0103: Variable name "f" doesn't conform to
snake_case naming style (invalid-name)

--js


