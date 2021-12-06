Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E3F1446A4BB
	for <lists+qemu-devel@lfdr.de>; Mon,  6 Dec 2021 19:36:31 +0100 (CET)
Received: from localhost ([::1]:55170 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1muIqk-00006V-Hp
	for lists+qemu-devel@lfdr.de; Mon, 06 Dec 2021 13:36:30 -0500
Received: from eggs.gnu.org ([209.51.188.92]:34940)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1muIpc-0007OB-OR
 for qemu-devel@nongnu.org; Mon, 06 Dec 2021 13:35:20 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:34852)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1muIpY-0005V4-PD
 for qemu-devel@nongnu.org; Mon, 06 Dec 2021 13:35:19 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1638815714;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=f+9VYvmuExlEFT8B8E8/74NJ4ulwwLhcQva6wnu17eA=;
 b=OdvvJ/8WSopYa7rrBRcBQf7T9ezXCnP54WC44EBXPTYtuIbUvYYl9P3HuBZITQ38+Yfep+
 I4NBvHf3J/HFq44KbQuGucSI0+oAYyMW9sA4l3UvyxI+IhOijeaLJwi9B3IxL6DNlwj5oy
 lDuS0RBcMFjqbhQZG5AG3aZBeS1ZDsE=
Received: from mail-ua1-f70.google.com (mail-ua1-f70.google.com
 [209.85.222.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-411-6RC_eD9QNreSZysFzcw2KA-1; Mon, 06 Dec 2021 13:35:12 -0500
X-MC-Unique: 6RC_eD9QNreSZysFzcw2KA-1
Received: by mail-ua1-f70.google.com with SMTP id
 h6-20020a9f3006000000b002e6e81fda51so6549240uab.4
 for <qemu-devel@nongnu.org>; Mon, 06 Dec 2021 10:35:12 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=f+9VYvmuExlEFT8B8E8/74NJ4ulwwLhcQva6wnu17eA=;
 b=a4uvdtmWAvFL9k7fufAHwiE1jy786lddPuxDBEeh0lDZW1GTGZUrnRJWQjZoO1l2+v
 fTjZS1tENa6iRlq+xYRfCXPn89L0ArwIZ6Xb2Y6XHm5mJn7PU3dY4M3by7SdbdYLNwZJ
 U27XMsTxNTw0LcV8+pC9xNy7wOPO7IMUIOLnRQorH6S6fm+/Wo6/K9TrGtNYcWIIaPwX
 7X7bUqTmXzgKN5hgHj1iSCwlV+pfa8ZhK9FpIPb6Jviei26Q73XbxUCKOXQ9qlahIEDk
 ditlXRVkMa1UbAGCQp8xOZZi/QeHe5p49JKZxSSTYn09yqIiIU0TmNXy6/GAykPpaLj0
 nTZw==
X-Gm-Message-State: AOAM530hK7HvWxW0xal79y9DwF900++04vmBwAdY1P9mEkq1YurkeLh0
 q8hFerPxVb0FuHuxNobpquBIKbfr6+upc6u2O46wAvzotU426gMaB2xpCZJZOjtNWhLrGwsBD1W
 4ekF7bx4VriYI5weLvk5C/2ZUPQOyRK0=
X-Received: by 2002:a05:6122:2158:: with SMTP id
 m24mr43937520vkd.1.1638815711523; 
 Mon, 06 Dec 2021 10:35:11 -0800 (PST)
X-Google-Smtp-Source: ABdhPJxs/hg7X/JhfWebaqOHcwRqDo4T0GbEnfWianFvtxIrRK4LR+QhpZYMeWWWA/2+q+AmSXUwOJjwueP+clV4X2I=
X-Received: by 2002:a05:6122:2158:: with SMTP id
 m24mr43937484vkd.1.1638815711258; 
 Mon, 06 Dec 2021 10:35:11 -0800 (PST)
MIME-Version: 1.0
References: <20211203122223.2780098-1-vsementsov@virtuozzo.com>
 <20211203122223.2780098-4-vsementsov@virtuozzo.com>
In-Reply-To: <20211203122223.2780098-4-vsementsov@virtuozzo.com>
From: John Snow <jsnow@redhat.com>
Date: Mon, 6 Dec 2021 13:35:00 -0500
Message-ID: <CAFn=p-YFHGbfbwXjKYGK0ypiec+-EkdF+raQKkvPqf536gbJ2w@mail.gmail.com>
Subject: Re: [PATCH 3/3] iotests: check: multiprocessing support
To: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=jsnow@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: multipart/alternative; boundary="00000000000052829e05d27e844f"
Received-SPF: pass client-ip=170.10.129.124; envelope-from=jsnow@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -33
X-Spam_score: -3.4
X-Spam_bar: ---
X-Spam_report: (-3.4 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.619,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 HTML_MESSAGE=0.001, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
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
Cc: Kevin Wolf <kwolf@redhat.com>, den@openvz.org,
 Hanna Reitz <hreitz@redhat.com>, qemu-devel <qemu-devel@nongnu.org>,
 Qemu-block <qemu-block@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--00000000000052829e05d27e844f
Content-Type: text/plain; charset="UTF-8"

On Fri, Dec 3, 2021 at 7:22 AM Vladimir Sementsov-Ogievskiy <
vsementsov@virtuozzo.com> wrote:

> Add -j <JOBS> parameter, to run tests in several jobs simultaneously.
> For realization - simply utilize multiprocessing.Pool class.
>
> Notes:
>
> 1. Of course, tests can't run simultaneously in same TEST_DIR. So,
>    use subdirectories TEST_DIR/testname/ and SOCK_DIR/testname/
>    instead of simply TEST_DIR and SOCK_DIR
>
>
SOCK_DIR was introduced because TEST_DIR was getting too long, and the
length of the filepath was causing problems on some platforms. I hope that
we aren't pushing our luck by making the directory longer here. Using the
test name is nice because a human operator can quickly correlate
directories to the tests that populated them, but if test names get kind of
long, I wonder if we'll cause problems again.

Just a stray thought.


> 2. multiprocessing.Pool.starmap function doesn't support passing
>    context managers, so we can't simply pass "self". Happily, we need
>    self only for read-only access, and it just works if it is defined
>    in global space. So, add a temporary link TestRunner.shared_self
>    during run_tests().
>

I'm a little confused on this point, see below


> Signed-off-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
> ---
>  tests/qemu-iotests/check         |  4 +-
>  tests/qemu-iotests/testrunner.py | 69 ++++++++++++++++++++++++++++----
>  2 files changed, 64 insertions(+), 9 deletions(-)
>
> diff --git a/tests/qemu-iotests/check b/tests/qemu-iotests/check
> index 43a4b694cc..0c27721a41 100755
> --- a/tests/qemu-iotests/check
> +++ b/tests/qemu-iotests/check
> @@ -34,6 +34,8 @@ def make_argparser() -> argparse.ArgumentParser:
>                     help='show me, do not run tests')
>      p.add_argument('-makecheck', action='store_true',
>                     help='pretty print output for make check')
> +    p.add_argument('-j', dest='jobs', type=int, default=1,
> +                   help='run tests in multiple parallel jobs')
>
>      p.add_argument('-d', dest='debug', action='store_true', help='debug')
>      p.add_argument('-p', dest='print', action='store_true',
> @@ -165,6 +167,6 @@ if __name__ == '__main__':
>          with TestRunner(env, makecheck=args.makecheck,
>                          color=args.color) as tr:
>              paths = [os.path.join(env.source_iotests, t) for t in tests]
> -            ok = tr.run_tests(paths)
> +            ok = tr.run_tests(paths, args.jobs)
>              if not ok:
>                  sys.exit(1)
>

(OK)


> diff --git a/tests/qemu-iotests/testrunner.py
> b/tests/qemu-iotests/testrunner.py
> index a9f2feb58c..0feaa396d0 100644
> --- a/tests/qemu-iotests/testrunner.py
> +++ b/tests/qemu-iotests/testrunner.py
> @@ -26,6 +26,7 @@
>  import json
>  import termios
>  import sys
> +from multiprocessing import Pool
>  from contextlib import contextmanager
>  from typing import List, Optional, Iterator, Any, Sequence, Dict, \
>          ContextManager
> @@ -126,6 +127,31 @@ def __init__(self, status: str, description: str = '',
>
>
>  class TestRunner(ContextManager['TestRunner']):
> +    shared_self = None
>
+
> +    @staticmethod
> +    def proc_run_test(test: str, test_field_width: int) -> TestResult:
> +        # We are in a subprocess, we can't change the runner object!
>

*can't*, or shouldn't? I thought changing anything would just result in the
child process diverging, but nothing harmful overall. Am I mistaken?


> +        runner = TestRunner.shared_self
> +        assert runner is not None
> +        return runner.run_test(test, test_field_width, mp=True)
> +
> +    def run_tests_pool(self, tests: List[str],
> +                       test_field_width: int, jobs: int) ->
> List[TestResult]:
> +
> +        # passing self directly to Pool.starmap() just doesn't work,
> because
> +        # it's a context manager.
>

Why, what happens? (Or what doesn't happen?)

(I believe you that it doesn't work, but it's not immediately obvious to me
why.)


> +        assert TestRunner.shared_self is None
> +        TestRunner.shared_self = self
> +
> +        with Pool(jobs) as p:
> +            results = p.starmap(self.proc_run_test,
> +                                zip(tests, [test_field_width] *
> len(tests)))
> +
> +        TestRunner.shared_self = None
> +
> +        return results
> +
>      def __init__(self, env: TestEnv, makecheck: bool = False,
>                   color: str = 'auto') -> None:
>          self.env = env
> @@ -219,11 +245,16 @@ def find_reference(self, test: str) -> str:
>
>          return f'{test}.out'
>
> -    def do_run_test(self, test: str) -> TestResult:
> +    def do_run_test(self, test: str, mp: bool) -> TestResult:
>          """
>          Run one test
>
>          :param test: test file path
> +        :param mp: if true, we are in a multiprocessing environment, use
> +                   personal subdirectories for test run
> +
> +        Note: this method may be called from subprocess, so it does not
> +        change ``self`` object in any way!
>          """
>

Maybe worth mentioning that it *does* change environment variables, but
because this is "mp", it won't affect the parent execution environment.


>
>          f_test = Path(test)
> @@ -249,6 +280,12 @@ def do_run_test(self, test: str) -> TestResult:
>
>          args = [str(f_test.resolve())]
>          env = self.env.prepare_subprocess(args)
> +        if mp:
> +            # Split test directories, so that tests running in parallel
> don't
> +            # break each other.
> +            for d in ['TEST_DIR', 'SOCK_DIR']:
> +                env[d] = os.path.join(env[d], f_test.name)
> +                Path(env[d]).mkdir(parents=True, exist_ok=True)
>
>          t0 = time.time()
>          with f_bad.open('w', encoding="utf-8") as f:
> @@ -291,23 +328,32 @@ def do_run_test(self, test: str) -> TestResult:
>                                casenotrun=casenotrun)
>
>      def run_test(self, test: str,
> -                 test_field_width: Optional[int] = None) -> TestResult:
> +                 test_field_width: Optional[int] = None,
> +                 mp: bool = False) -> TestResult:
>          """
>          Run one test and print short status
>
>          :param test: test file path
>          :param test_field_width: width for first field of status format
> +        :param mp: if true, we are in a multiprocessing environment,
> don't try
> +                   to rewrite things in stdout
> +
> +        Note: this method may be called from subprocess, so it does not
> +        change ``self`` object in any way!
>          """
>
>          last_el = self.last_elapsed.get(test)
>          start = datetime.datetime.now().strftime('%H:%M:%S')
>
>          if not self.makecheck:
> -            self.test_print_one_line(test=test, starttime=start,
> -                                     lasttime=last_el, end='\r',
> +            self.test_print_one_line(test=test,
> +                                     status = 'started' if mp else '...',
> +                                     starttime=start,
> +                                     lasttime=last_el,
> +                                     end = '\n' if mp else '\r',
>                                       test_field_width=test_field_width)
>
> -        res = self.do_run_test(test)
> +        res = self.do_run_test(test, mp)
>
>          end = datetime.datetime.now().strftime('%H:%M:%S')
>          self.test_print_one_line(test=test, status=res.status,
>
@@ -321,7 +367,7 @@ def run_test(self, test: str,
>
>          return res
>
> -    def run_tests(self, tests: List[str]) -> bool:
> +    def run_tests(self, tests: List[str], jobs: int = 1) -> bool:
>          n_run = 0
>          failed = []
>          notrun = []
> @@ -332,9 +378,16 @@ def run_tests(self, tests: List[str]) -> bool:
>
>          test_field_width = max(len(os.path.basename(t)) for t in tests) +
> 2
>
> -        for t in tests:
> +        if jobs > 1:
> +            results = self.run_tests_pool(tests, test_field_width, jobs)
> +
> +        for i, t in enumerate(tests):
>              name = os.path.basename(t)
> -            res = self.run_test(t, test_field_width=test_field_width)
> +
> +            if jobs > 1:
> +                res = results[i]
> +            else:
> +                res = self.run_test(t, test_field_width)
>
>              assert res.status in ('pass', 'fail', 'not run')
>
>
Looks good and surprisingly minimal, I just have a curiosity about the
nature of the workaround here.

Either way, I believe this will probably work as written, so I can give it
an ACK at a minimum while I wait for answers.

Acked-by: John Snow <jsnow@redhat.com>

--00000000000052829e05d27e844f
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote">=
<div dir=3D"ltr" class=3D"gmail_attr">On Fri, Dec 3, 2021 at 7:22 AM Vladim=
ir Sementsov-Ogievskiy &lt;<a href=3D"mailto:vsementsov@virtuozzo.com">vsem=
entsov@virtuozzo.com</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quo=
te" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204=
);padding-left:1ex">Add -j &lt;JOBS&gt; parameter, to run tests in several =
jobs simultaneously.<br>
For realization - simply utilize multiprocessing.Pool class.<br>
<br>
Notes:<br>
<br>
1. Of course, tests can&#39;t run simultaneously in same TEST_DIR. So,<br>
=C2=A0 =C2=A0use subdirectories TEST_DIR/testname/ and SOCK_DIR/testname/<b=
r>
=C2=A0 =C2=A0instead of simply TEST_DIR and SOCK_DIR<br>
<br></blockquote><div><br></div><div>SOCK_DIR was introduced because TEST_D=
IR was getting too long, and the length of the filepath was causing problem=
s on some platforms. I hope that we aren&#39;t pushing our luck by making t=
he directory longer here. Using the test name is nice because a human opera=
tor can quickly correlate directories to the tests that populated them, but=
 if test names get kind of long, I wonder if we&#39;ll cause problems again=
.</div><div><br></div><div>Just a stray thought.<br></div><div>=C2=A0</div>=
<blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-=
left:1px solid rgb(204,204,204);padding-left:1ex">
2. multiprocessing.Pool.starmap function doesn&#39;t support passing<br>
=C2=A0 =C2=A0context managers, so we can&#39;t simply pass &quot;self&quot;=
. Happily, we need<br>
=C2=A0 =C2=A0self only for read-only access, and it just works if it is def=
ined<br>
=C2=A0 =C2=A0in global space. So, add a temporary link TestRunner.shared_se=
lf<br>
=C2=A0 =C2=A0during run_tests().<br></blockquote><div><br></div><div>I&#39;=
m a little confused on this point, see below <br></div></div><div class=3D"=
gmail_quote"><div>=C2=A0</div><blockquote class=3D"gmail_quote" style=3D"ma=
rgin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:=
1ex">
Signed-off-by: Vladimir Sementsov-Ogievskiy &lt;<a href=3D"mailto:vsementso=
v@virtuozzo.com" target=3D"_blank">vsementsov@virtuozzo.com</a>&gt;<br>
---<br>
=C2=A0tests/qemu-iotests/check=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0|=C2=A0 4 +=
-<br>
=C2=A0tests/qemu-iotests/testrunner.py | 69 ++++++++++++++++++++++++++++---=
-<br>
=C2=A02 files changed, 64 insertions(+), 9 deletions(-)<br>
<br>
diff --git a/tests/qemu-iotests/check b/tests/qemu-iotests/check<br>
index 43a4b694cc..0c27721a41 100755<br>
--- a/tests/qemu-iotests/check<br>
+++ b/tests/qemu-iotests/check<br>
@@ -34,6 +34,8 @@ def make_argparser() -&gt; argparse.ArgumentParser:<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 help=
=3D&#39;show me, do not run tests&#39;)<br>
=C2=A0 =C2=A0 =C2=A0p.add_argument(&#39;-makecheck&#39;, action=3D&#39;stor=
e_true&#39;,<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 help=
=3D&#39;pretty print output for make check&#39;)<br>
+=C2=A0 =C2=A0 p.add_argument(&#39;-j&#39;, dest=3D&#39;jobs&#39;, type=3Di=
nt, default=3D1,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0help=
=3D&#39;run tests in multiple parallel jobs&#39;)<br>
<br>
=C2=A0 =C2=A0 =C2=A0p.add_argument(&#39;-d&#39;, dest=3D&#39;debug&#39;, ac=
tion=3D&#39;store_true&#39;, help=3D&#39;debug&#39;)<br>
=C2=A0 =C2=A0 =C2=A0p.add_argument(&#39;-p&#39;, dest=3D&#39;print&#39;, ac=
tion=3D&#39;store_true&#39;,<br>
@@ -165,6 +167,6 @@ if __name__ =3D=3D &#39;__main__&#39;:<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0with TestRunner(env, makecheck=3Dargs.mak=
echeck,<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0color=3Dargs.color) as tr:<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0paths =3D [os.path.join(env=
.source_iotests, t) for t in tests]<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ok =3D tr.run_tests(paths)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ok =3D tr.run_tests(paths, <a hr=
ef=3D"http://args.jobs" rel=3D"noreferrer" target=3D"_blank">args.jobs</a>)=
<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if not ok:<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0sys.exit(1)<b=
r></blockquote><div><br></div><div>(OK)<br></div><div>=C2=A0</div><blockquo=
te class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px =
solid rgb(204,204,204);padding-left:1ex">
diff --git a/tests/qemu-iotests/testrunner.py b/tests/qemu-iotests/testrunn=
er.py<br>
index a9f2feb58c..0feaa396d0 100644<br>
--- a/tests/qemu-iotests/testrunner.py<br>
+++ b/tests/qemu-iotests/testrunner.py<br>
@@ -26,6 +26,7 @@<br>
=C2=A0import json<br>
=C2=A0import termios<br>
=C2=A0import sys<br>
+from multiprocessing import Pool<br>
=C2=A0from contextlib import contextmanager<br>
=C2=A0from typing import List, Optional, Iterator, Any, Sequence, Dict, \<b=
r>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0ContextManager<br>
@@ -126,6 +127,31 @@ def __init__(self, status: str, description: str =3D &=
#39;&#39;,<br>
<br>
<br>
=C2=A0class TestRunner(ContextManager[&#39;TestRunner&#39;]):<br>
+=C2=A0 =C2=A0 shared_self =3D None<br></blockquote><blockquote class=3D"gm=
ail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,=
204,204);padding-left:1ex">
+<br>
+=C2=A0 =C2=A0 @staticmethod<br>
+=C2=A0 =C2=A0 def proc_run_test(test: str, test_field_width: int) -&gt; Te=
stResult:<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 # We are in a subprocess, we can&#39;t change =
the runner object!<br></blockquote><div><br></div><div>*can&#39;t*, or shou=
ldn&#39;t? I thought changing anything would just result in the child proce=
ss diverging, but nothing harmful overall. Am I mistaken?<br></div><div>=C2=
=A0</div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8e=
x;border-left:1px solid rgb(204,204,204);padding-left:1ex">
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 runner =3D TestRunner.shared_self<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 assert runner is not None<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 return runner.run_test(test, test_field_width,=
 mp=3DTrue)<br>
+<br>
+=C2=A0 =C2=A0 def run_tests_pool(self, tests: List[str],<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0test_field_width: int, jobs: int) -&gt; List[TestResult]:<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 # passing self directly to Pool.starmap() just=
 doesn&#39;t work, because<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 # it&#39;s a context manager.<br></blockquote>=
<div><br></div><div>Why, what happens? (Or what doesn&#39;t happen?)</div><=
div><br></div><div>(I believe you that it doesn&#39;t work, but it&#39;s no=
t immediately obvious to me why.)<br></div><div>=C2=A0<br></div><blockquote=
 class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px so=
lid rgb(204,204,204);padding-left:1ex">
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 assert TestRunner.shared_self is None<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 TestRunner.shared_self =3D self<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 with Pool(jobs) as p:<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 results =3D p.starmap(self.proc_=
run_test,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 zip(tests, [test_field_width] * len(=
tests)))<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 TestRunner.shared_self =3D None<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 return results<br>
+<br>
=C2=A0 =C2=A0 =C2=A0def __init__(self, env: TestEnv, makecheck: bool =3D Fa=
lse,<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 color: str =
=3D &#39;auto&#39;) -&gt; None:<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0self.env =3D env<br>
@@ -219,11 +245,16 @@ def find_reference(self, test: str) -&gt; str:<br>
<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return f&#39;{test}.out&#39;<br>
<br>
-=C2=A0 =C2=A0 def do_run_test(self, test: str) -&gt; TestResult:<br>
+=C2=A0 =C2=A0 def do_run_test(self, test: str, mp: bool) -&gt; TestResult:=
<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&quot;&quot;&quot;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0Run one test<br>
<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0:param test: test file path<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 :param mp: if true, we are in a multiprocessin=
g environment, use<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0perso=
nal subdirectories for test run<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 Note: this method may be called from subproces=
s, so it does not<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 change ``self`` object in any way!<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&quot;&quot;&quot;<br></blockquote><div><=
br></div><div>Maybe worth mentioning that it *does* change environment vari=
ables, but because this is &quot;mp&quot;, it won&#39;t affect the parent e=
xecution environment.<br></div><div>=C2=A0</div><blockquote class=3D"gmail_=
quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,=
204);padding-left:1ex">
<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0f_test =3D Path(test)<br>
@@ -249,6 +280,12 @@ def do_run_test(self, test: str) -&gt; TestResult:<br>
<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0args =3D [str(f_test.resolve())]<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0env =3D self.env.prepare_subprocess(args)=
<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 if mp:<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 # Split test directories, so tha=
t tests running in parallel don&#39;t<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 # break each other.<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 for d in [&#39;TEST_DIR&#39;, &#=
39;SOCK_DIR&#39;]:<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 env[d] =3D os.path=
.join(env[d], <a href=3D"http://f_test.name" rel=3D"noreferrer" target=3D"_=
blank">f_test.name</a>)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 Path(env[d]).mkdir=
(parents=3DTrue, exist_ok=3DTrue)<br>
<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0t0 =3D time.time()<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0with f_bad.open(&#39;w&#39;, encoding=3D&=
quot;utf-8&quot;) as f:<br>
@@ -291,23 +328,32 @@ def do_run_test(self, test: str) -&gt; TestResult:<br=
>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0casenotrun=3Dcasenotrun)<br>
<br>
=C2=A0 =C2=A0 =C2=A0def run_test(self, test: str,<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0test_field_w=
idth: Optional[int] =3D None) -&gt; TestResult:<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0test_field_w=
idth: Optional[int] =3D None,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0mp: bool =3D=
 False) -&gt; TestResult:<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&quot;&quot;&quot;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0Run one test and print short status<br>
<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0:param test: test file path<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0:param test_field_width: width for first =
field of status format<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 :param mp: if true, we are in a multiprocessin=
g environment, don&#39;t try<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0to re=
write things in stdout<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 Note: this method may be called from subproces=
s, so it does not<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 change ``self`` object in any way!<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&quot;&quot;&quot;<br>
<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0last_el =3D self.last_elapsed.get(test)<b=
r>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0start =3D datetime.datetime.now().strftim=
e(&#39;%H:%M:%S&#39;)<br>
<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if not self.makecheck:<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 self.test_print_one_line(test=3D=
test, starttime=3Dstart,<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0lasttime=3Dlast_=
el, end=3D&#39;\r&#39;,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 self.test_print_one_line(test=3D=
test,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0status =3D &#39;=
started&#39; if mp else &#39;...&#39;,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0starttime=3Dstar=
t,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0lasttime=3Dlast_=
el,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0end =3D &#39;\n&=
#39; if mp else &#39;\r&#39;,<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 test_field_widt=
h=3Dtest_field_width)<br>
<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 res =3D self.do_run_test(test)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 res =3D self.do_run_test(test, mp)<br>
<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0end =3D datetime.datetime.now().strftime(=
&#39;%H:%M:%S&#39;)<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0self.test_print_one_line(test=3Dtest, sta=
tus=3Dres.status,<br></blockquote><blockquote class=3D"gmail_quote" style=
=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding=
-left:1ex">
@@ -321,7 +367,7 @@ def run_test(self, test: str,<br>
<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return res<br>
<br>
-=C2=A0 =C2=A0 def run_tests(self, tests: List[str]) -&gt; bool:<br>
+=C2=A0 =C2=A0 def run_tests(self, tests: List[str], jobs: int =3D 1) -&gt;=
 bool:<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0n_run =3D 0<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0failed =3D []<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0notrun =3D []<br>
@@ -332,9 +378,16 @@ def run_tests(self, tests: List[str]) -&gt; bool:<br>
<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0test_field_width =3D max(len(os.path.base=
name(t)) for t in tests) + 2<br>
<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 for t in tests:<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 if jobs &gt; 1:<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 results =3D self.run_tests_pool(=
tests, test_field_width, jobs)<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 for i, t in enumerate(tests):<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0name =3D os.path.basename(t=
)<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 res =3D self.run_test(t, test_fi=
eld_width=3Dtest_field_width)<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if jobs &gt; 1:<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 res =3D results[i]=
<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 else:<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 res =3D self.run_t=
est(t, test_field_width)<br>
<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0assert res.status in (&#39;=
pass&#39;, &#39;fail&#39;, &#39;not run&#39;)<br>
<br></blockquote></div><div class=3D"gmail_quote"><br></div><div class=3D"g=
mail_quote">Looks good and surprisingly minimal, I just have a curiosity ab=
out the nature of the workaround here.</div><div class=3D"gmail_quote"><br>=
</div><div class=3D"gmail_quote">Either way, I believe this will probably w=
ork as written, so I can give it an ACK at a minimum while I wait for answe=
rs.</div><div class=3D"gmail_quote"><br></div><div class=3D"gmail_quote">Ac=
ked-by: John Snow &lt;<a href=3D"mailto:jsnow@redhat.com">jsnow@redhat.com<=
/a>&gt;<br></div><br></div>

--00000000000052829e05d27e844f--


