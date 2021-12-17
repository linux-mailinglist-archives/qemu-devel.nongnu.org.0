Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A992F478111
	for <lists+qemu-devel@lfdr.de>; Fri, 17 Dec 2021 01:04:54 +0100 (CET)
Received: from localhost ([::1]:50740 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1my0k1-00044n-94
	for lists+qemu-devel@lfdr.de; Thu, 16 Dec 2021 19:04:53 -0500
Received: from eggs.gnu.org ([209.51.188.92]:58434)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1my0hn-0003KM-L9
 for qemu-devel@nongnu.org; Thu, 16 Dec 2021 19:02:35 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:30732)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1my0hk-0006RC-FI
 for qemu-devel@nongnu.org; Thu, 16 Dec 2021 19:02:34 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1639699351;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=M8Qlt1GG9/CEU7ZfNuXiuJlqsb92m38pfWnkWjq80aE=;
 b=XOkP99c/2FMDrAcNh/1OyKpg93ko6q19qSQpyBVLao9uuWAbjqTg3PzOj8feyY9JBEL+Wo
 jdnWwB6Aej5iuUnc/44CsN+6aDYB2vI7D6zwu2ZxSgNZo2KWwH0ko/bYB5tUdUke9MW4bx
 8Uy6Yf3fSC8SCcb7fArcrAbKFPR4CLA=
Received: from mail-vk1-f200.google.com (mail-vk1-f200.google.com
 [209.85.221.200]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-576-3KhtC9-vM62V1Desf1ro-Q-1; Thu, 16 Dec 2021 19:02:27 -0500
X-MC-Unique: 3KhtC9-vM62V1Desf1ro-Q-1
Received: by mail-vk1-f200.google.com with SMTP id
 n19-20020ac5c253000000b003030c0efe45so174175vkk.20
 for <qemu-devel@nongnu.org>; Thu, 16 Dec 2021 16:02:27 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=M8Qlt1GG9/CEU7ZfNuXiuJlqsb92m38pfWnkWjq80aE=;
 b=c7EdfYjsRqZHTtuyDsNk3AaXa8Wg6Td1DDw2YEs1DObM+2PoYw10zZ5EH4VzpGToDP
 vqBZsvKIB0gi0xo9fYWgOw7zh2Acb6SHj4grRX1Qj1ObwNQdZOZdrr9Eh2JDnj45oCKt
 sqvqeJpxnzyby/pCQqcXMzi9P6j1KpdoFJg4h/vwZrDJIkroVBY7gpE/XMbu+IN8l3IV
 ZKYuBklxYXcPnQ0CuVjno0R80BhK2rMm1qTzT8nutSSNRk9OuvSNFU2juo/3JLXanQ5M
 SIgiHUqq04ai0f5avrXuFIjRnhdriUrzL2s7JkeU7f+gBBqVGOa/EUw5yeiRsP9XceG6
 bDLA==
X-Gm-Message-State: AOAM531TaSgNlF6WmK+mJY67uFzxjad3K3gJfVT8/J2LFSgxPMQwvCr2
 Nl4j6Dv8ktc7s5rGcBj+jDlR5ZjOmm1+arqliYE1GQ/StEiuWrIg0Y7p/MG5mgopVD0qqoDJN4+
 Sx5v7eTKYJKgymePSREJ2kYz6Lpx3fe0=
X-Received: by 2002:a67:441:: with SMTP id 62mr148025vse.61.1639699346999;
 Thu, 16 Dec 2021 16:02:26 -0800 (PST)
X-Google-Smtp-Source: ABdhPJx+PyhJLVVDuIH7g6SlDidqw7oeavYu3h1LxQlZKXUfNwh9TDUMAIRIzc0zgvdgEpZ/aIjb2Yhgak5h4HtEhjw=
X-Received: by 2002:a67:441:: with SMTP id 62mr148015vse.61.1639699346805;
 Thu, 16 Dec 2021 16:02:26 -0800 (PST)
MIME-Version: 1.0
References: <20211210201450.101576-1-vsementsov@virtuozzo.com>
In-Reply-To: <20211210201450.101576-1-vsementsov@virtuozzo.com>
From: John Snow <jsnow@redhat.com>
Date: Thu, 16 Dec 2021 19:02:16 -0500
Message-ID: <CAFn=p-YzjhhQOgw5c_1WOrjXGMMtf+XjGHoO0==fLMTjpzQjBg@mail.gmail.com>
Subject: Re: [PATCH] iotests/testrunner.py: refactor test_field_width
To: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=jsnow@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: multipart/alternative; boundary="0000000000001aeb5c05d34c415b"
Received-SPF: pass client-ip=170.10.133.124; envelope-from=jsnow@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.718,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 HTML_MESSAGE=0.001, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001,
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
Cc: Kevin Wolf <kwolf@redhat.com>, Hanna Reitz <hreitz@redhat.com>,
 qemu-devel <qemu-devel@nongnu.org>, Qemu-block <qemu-block@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--0000000000001aeb5c05d34c415b
Content-Type: text/plain; charset="UTF-8"

On Fri, Dec 10, 2021 at 3:15 PM Vladimir Sementsov-Ogievskiy <
vsementsov@virtuozzo.com> wrote:

> A lot of Optional[] types doesn't make code beautiful.
> test_field_width defaults to 8, but that is never used in the code.
>
> More over, if we want some default behavior for single call of
> test_run(), it should just print the whole test name, not limiting or
> expanding its width, so 8 is bad default.
>
> So, just drop the default as unused for now.
>
> Signed-off-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
> ---
>
> This is a follow-up for "[PATCH 0/3] iotests: multiprocessing!!" and
> based on Hanna's block-next branch.
>
> Based-on: <20211203122223.2780098-1-vsementsov@virtuozzo.com>
>
>  tests/qemu-iotests/testrunner.py | 21 ++++++++++-----------
>  1 file changed, 10 insertions(+), 11 deletions(-)
>
> diff --git a/tests/qemu-iotests/testrunner.py
> b/tests/qemu-iotests/testrunner.py
> index 0feaa396d0..15788f919e 100644
> --- a/tests/qemu-iotests/testrunner.py
> +++ b/tests/qemu-iotests/testrunner.py
> @@ -174,19 +174,17 @@ def __enter__(self) -> 'TestRunner':
>      def __exit__(self, exc_type: Any, exc_value: Any, traceback: Any) ->
> None:
>          self._stack.close()
>
> -    def test_print_one_line(self, test: str, starttime: str,
> +    def test_print_one_line(self, test: str,
> +                            test_field_width: int,
> +                            starttime: str,
>                              endtime: Optional[str] = None, status: str =
> '...',
>                              lasttime: Optional[float] = None,
>                              thistime: Optional[float] = None,
>                              description: str = '',
> -                            test_field_width: Optional[int] = None,
>                              end: str = '\n') -> None:
>          """ Print short test info before/after test run """
>          test = os.path.basename(test)
>
> -        if test_field_width is None:
> -            test_field_width = 8
> -
>          if self.makecheck and status != '...':
>              if status and status != 'pass':
>                  status = f' [{status}]'
> @@ -328,7 +326,7 @@ def do_run_test(self, test: str, mp: bool) ->
> TestResult:
>                                casenotrun=casenotrun)
>
>      def run_test(self, test: str,
> -                 test_field_width: Optional[int] = None,
> +                 test_field_width: int,
>                   mp: bool = False) -> TestResult:
>          """
>          Run one test and print short status
> @@ -347,20 +345,21 @@ def run_test(self, test: str,
>
>          if not self.makecheck:
>              self.test_print_one_line(test=test,
> +                                     test_field_width=test_field_width,
>                                       status = 'started' if mp else '...',
>                                       starttime=start,
>                                       lasttime=last_el,
> -                                     end = '\n' if mp else '\r',
> -                                     test_field_width=test_field_width)
> +                                     end = '\n' if mp else '\r')
>
>          res = self.do_run_test(test, mp)
>
>          end = datetime.datetime.now().strftime('%H:%M:%S')
> -        self.test_print_one_line(test=test, status=res.status,
> +        self.test_print_one_line(test=test,
> +                                 test_field_width=test_field_width,
> +                                 status=res.status,
>                                   starttime=start, endtime=end,
>                                   lasttime=last_el, thistime=res.elapsed,
> -                                 description=res.description,
> -                                 test_field_width=test_field_width)
> +                                 description=res.description)
>
>          if res.casenotrun:
>              print(res.casenotrun)
> --
> 2.31.1
>
>
"LGTM"

Reviewed-by: John Snow <jsnow@redhat.com>

--0000000000001aeb5c05d34c415b
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: base64

PGRpdiBkaXI9Imx0ciI+PGRpdiBkaXI9Imx0ciI+PGJyPjwvZGl2Pjxicj48ZGl2IGNsYXNzPSJn
bWFpbF9xdW90ZSI+PGRpdiBkaXI9Imx0ciIgY2xhc3M9ImdtYWlsX2F0dHIiPk9uIEZyaSwgRGVj
IDEwLCAyMDIxIGF0IDM6MTUgUE0gVmxhZGltaXIgU2VtZW50c292LU9naWV2c2tpeSAmbHQ7PGEg
aHJlZj0ibWFpbHRvOnZzZW1lbnRzb3ZAdmlydHVvenpvLmNvbSI+dnNlbWVudHNvdkB2aXJ0dW96
em8uY29tPC9hPiZndDsgd3JvdGU6PGJyPjwvZGl2PjxibG9ja3F1b3RlIGNsYXNzPSJnbWFpbF9x
dW90ZSIgc3R5bGU9Im1hcmdpbjowcHggMHB4IDBweCAwLjhleDtib3JkZXItbGVmdDoxcHggc29s
aWQgcmdiKDIwNCwyMDQsMjA0KTtwYWRkaW5nLWxlZnQ6MWV4Ij5BIGxvdCBvZiBPcHRpb25hbFtd
IHR5cGVzIGRvZXNuJiMzOTt0IG1ha2UgY29kZSBiZWF1dGlmdWwuPGJyPg0KdGVzdF9maWVsZF93
aWR0aCBkZWZhdWx0cyB0byA4LCBidXQgdGhhdCBpcyBuZXZlciB1c2VkIGluIHRoZSBjb2RlLjxi
cj4NCjxicj4NCk1vcmUgb3ZlciwgaWYgd2Ugd2FudCBzb21lIGRlZmF1bHQgYmVoYXZpb3IgZm9y
IHNpbmdsZSBjYWxsIG9mPGJyPg0KdGVzdF9ydW4oKSwgaXQgc2hvdWxkIGp1c3QgcHJpbnQgdGhl
IHdob2xlIHRlc3QgbmFtZSwgbm90IGxpbWl0aW5nIG9yPGJyPg0KZXhwYW5kaW5nIGl0cyB3aWR0
aCwgc28gOCBpcyBiYWQgZGVmYXVsdC48YnI+DQo8YnI+DQpTbywganVzdCBkcm9wIHRoZSBkZWZh
dWx0IGFzIHVudXNlZCBmb3Igbm93Ljxicj4NCjxicj4NClNpZ25lZC1vZmYtYnk6IFZsYWRpbWly
IFNlbWVudHNvdi1PZ2lldnNraXkgJmx0OzxhIGhyZWY9Im1haWx0bzp2c2VtZW50c292QHZpcnR1
b3p6by5jb20iIHRhcmdldD0iX2JsYW5rIj52c2VtZW50c292QHZpcnR1b3p6by5jb208L2E+Jmd0
Ozxicj4NCi0tLTxicj4NCjxicj4NClRoaXMgaXMgYSBmb2xsb3ctdXAgZm9yICZxdW90O1tQQVRD
SCAwLzNdIGlvdGVzdHM6IG11bHRpcHJvY2Vzc2luZyEhJnF1b3Q7IGFuZDxicj4NCmJhc2VkIG9u
IEhhbm5hJiMzOTtzIGJsb2NrLW5leHQgYnJhbmNoLjxicj4NCjxicj4NCkJhc2VkLW9uOiAmbHQ7
PGEgaHJlZj0ibWFpbHRvOjIwMjExMjAzMTIyMjIzLjI3ODAwOTgtMS12c2VtZW50c292QHZpcnR1
b3p6by5jb20iIHRhcmdldD0iX2JsYW5rIj4yMDIxMTIwMzEyMjIyMy4yNzgwMDk4LTEtdnNlbWVu
dHNvdkB2aXJ0dW96em8uY29tPC9hPiZndDs8YnI+DQo8YnI+DQrCoHRlc3RzL3FlbXUtaW90ZXN0
cy90ZXN0cnVubmVyLnB5IHwgMjEgKysrKysrKysrKy0tLS0tLS0tLS0tPGJyPg0KwqAxIGZpbGUg
Y2hhbmdlZCwgMTAgaW5zZXJ0aW9ucygrKSwgMTEgZGVsZXRpb25zKC0pPGJyPg0KPGJyPg0KZGlm
ZiAtLWdpdCBhL3Rlc3RzL3FlbXUtaW90ZXN0cy90ZXN0cnVubmVyLnB5IGIvdGVzdHMvcWVtdS1p
b3Rlc3RzL3Rlc3RydW5uZXIucHk8YnI+DQppbmRleCAwZmVhYTM5NmQwLi4xNTc4OGY5MTllIDEw
MDY0NDxicj4NCi0tLSBhL3Rlc3RzL3FlbXUtaW90ZXN0cy90ZXN0cnVubmVyLnB5PGJyPg0KKysr
IGIvdGVzdHMvcWVtdS1pb3Rlc3RzL3Rlc3RydW5uZXIucHk8YnI+DQpAQCAtMTc0LDE5ICsxNzQs
MTcgQEAgZGVmIF9fZW50ZXJfXyhzZWxmKSAtJmd0OyAmIzM5O1Rlc3RSdW5uZXImIzM5Ozo8YnI+
DQrCoCDCoCDCoGRlZiBfX2V4aXRfXyhzZWxmLCBleGNfdHlwZTogQW55LCBleGNfdmFsdWU6IEFu
eSwgdHJhY2ViYWNrOiBBbnkpIC0mZ3Q7IE5vbmU6PGJyPg0KwqAgwqAgwqAgwqAgwqBzZWxmLl9z
dGFjay5jbG9zZSgpPGJyPg0KPGJyPg0KLcKgIMKgIGRlZiB0ZXN0X3ByaW50X29uZV9saW5lKHNl
bGYsIHRlc3Q6IHN0ciwgc3RhcnR0aW1lOiBzdHIsPGJyPg0KK8KgIMKgIGRlZiB0ZXN0X3ByaW50
X29uZV9saW5lKHNlbGYsIHRlc3Q6IHN0ciw8YnI+DQorwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAg
wqAgwqAgwqAgwqAgwqAgwqAgdGVzdF9maWVsZF93aWR0aDogaW50LDxicj4NCivCoCDCoCDCoCDC
oCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCBzdGFydHRpbWU6IHN0ciw8YnI+DQrCoCDC
oCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoGVuZHRpbWU6IE9wdGlvbmFs
W3N0cl0gPSBOb25lLCBzdGF0dXM6IHN0ciA9ICYjMzk7Li4uJiMzOTssPGJyPg0KwqAgwqAgwqAg
wqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqBsYXN0dGltZTogT3B0aW9uYWxbZmxv
YXRdID0gTm9uZSw8YnI+DQrCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDC
oCDCoHRoaXN0aW1lOiBPcHRpb25hbFtmbG9hdF0gPSBOb25lLDxicj4NCsKgIMKgIMKgIMKgIMKg
IMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgZGVzY3JpcHRpb246IHN0ciA9ICYjMzk7JiMz
OTssPGJyPg0KLcKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIHRlc3Rf
ZmllbGRfd2lkdGg6IE9wdGlvbmFsW2ludF0gPSBOb25lLDxicj4NCsKgIMKgIMKgIMKgIMKgIMKg
IMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgZW5kOiBzdHIgPSAmIzM5O1xuJiMzOTspIC0mZ3Q7
IE5vbmU6PGJyPg0KwqAgwqAgwqAgwqAgwqAmcXVvdDsmcXVvdDsmcXVvdDsgUHJpbnQgc2hvcnQg
dGVzdCBpbmZvIGJlZm9yZS9hZnRlciB0ZXN0IHJ1biAmcXVvdDsmcXVvdDsmcXVvdDs8YnI+DQrC
oCDCoCDCoCDCoCDCoHRlc3QgPSBvcy5wYXRoLmJhc2VuYW1lKHRlc3QpPGJyPg0KPGJyPg0KLcKg
IMKgIMKgIMKgIGlmIHRlc3RfZmllbGRfd2lkdGggaXMgTm9uZTo8YnI+DQotwqAgwqAgwqAgwqAg
wqAgwqAgdGVzdF9maWVsZF93aWR0aCA9IDg8YnI+DQotPGJyPg0KwqAgwqAgwqAgwqAgwqBpZiBz
ZWxmLm1ha2VjaGVjayBhbmQgc3RhdHVzICE9ICYjMzk7Li4uJiMzOTs6PGJyPg0KwqAgwqAgwqAg
wqAgwqAgwqAgwqBpZiBzdGF0dXMgYW5kIHN0YXR1cyAhPSAmIzM5O3Bhc3MmIzM5Ozo8YnI+DQrC
oCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoHN0YXR1cyA9IGYmIzM5OyBbe3N0YXR1c31dJiMzOTs8
YnI+DQpAQCAtMzI4LDcgKzMyNiw3IEBAIGRlZiBkb19ydW5fdGVzdChzZWxmLCB0ZXN0OiBzdHIs
IG1wOiBib29sKSAtJmd0OyBUZXN0UmVzdWx0Ojxicj4NCsKgIMKgIMKgIMKgIMKgIMKgIMKgIMKg
IMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgY2FzZW5vdHJ1bj1jYXNlbm90cnVuKTxicj4NCjxicj4N
CsKgIMKgIMKgZGVmIHJ1bl90ZXN0KHNlbGYsIHRlc3Q6IHN0ciw8YnI+DQotwqAgwqAgwqAgwqAg
wqAgwqAgwqAgwqAgwqB0ZXN0X2ZpZWxkX3dpZHRoOiBPcHRpb25hbFtpbnRdID0gTm9uZSw8YnI+
DQorwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqB0ZXN0X2ZpZWxkX3dpZHRoOiBpbnQsPGJyPg0K
wqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgbXA6IGJvb2wgPSBGYWxzZSkgLSZndDsgVGVzdFJl
c3VsdDo8YnI+DQrCoCDCoCDCoCDCoCDCoCZxdW90OyZxdW90OyZxdW90Ozxicj4NCsKgIMKgIMKg
IMKgIMKgUnVuIG9uZSB0ZXN0IGFuZCBwcmludCBzaG9ydCBzdGF0dXM8YnI+DQpAQCAtMzQ3LDIw
ICszNDUsMjEgQEAgZGVmIHJ1bl90ZXN0KHNlbGYsIHRlc3Q6IHN0ciw8YnI+DQo8YnI+DQrCoCDC
oCDCoCDCoCDCoGlmIG5vdCBzZWxmLm1ha2VjaGVjazo8YnI+DQrCoCDCoCDCoCDCoCDCoCDCoCDC
oHNlbGYudGVzdF9wcmludF9vbmVfbGluZSh0ZXN0PXRlc3QsPGJyPg0KK8KgIMKgIMKgIMKgIMKg
IMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgdGVzdF9maWVsZF93aWR0
aD10ZXN0X2ZpZWxkX3dpZHRoLDxicj4NCsKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKg
IMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIHN0YXR1cyA9ICYjMzk7c3RhcnRlZCYjMzk7IGlmIG1w
IGVsc2UgJiMzOTsuLi4mIzM5Oyw8YnI+DQrCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDC
oCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCBzdGFydHRpbWU9c3RhcnQsPGJyPg0KwqAgwqAgwqAg
wqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgbGFzdHRpbWU9
bGFzdF9lbCw8YnI+DQotwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAg
wqAgwqAgwqAgwqAgwqBlbmQgPSAmIzM5O1xuJiMzOTsgaWYgbXAgZWxzZSAmIzM5O1xyJiMzOTss
PGJyPg0KLcKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKg
IMKgIMKgdGVzdF9maWVsZF93aWR0aD10ZXN0X2ZpZWxkX3dpZHRoKTxicj4NCivCoCDCoCDCoCDC
oCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoGVuZCA9ICYjMzk7
XG4mIzM5OyBpZiBtcCBlbHNlICYjMzk7XHImIzM5Oyk8YnI+DQo8YnI+DQrCoCDCoCDCoCDCoCDC
oHJlcyA9IHNlbGYuZG9fcnVuX3Rlc3QodGVzdCwgbXApPGJyPg0KPGJyPg0KwqAgwqAgwqAgwqAg
wqBlbmQgPSBkYXRldGltZS5kYXRldGltZS5ub3coKS5zdHJmdGltZSgmIzM5OyVIOiVNOiVTJiMz
OTspPGJyPg0KLcKgIMKgIMKgIMKgIHNlbGYudGVzdF9wcmludF9vbmVfbGluZSh0ZXN0PXRlc3Qs
IHN0YXR1cz1yZXMuc3RhdHVzLDxicj4NCivCoCDCoCDCoCDCoCBzZWxmLnRlc3RfcHJpbnRfb25l
X2xpbmUodGVzdD10ZXN0LDxicj4NCivCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDC
oCDCoCDCoCDCoCDCoCDCoHRlc3RfZmllbGRfd2lkdGg9dGVzdF9maWVsZF93aWR0aCw8YnI+DQor
wqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqBzdGF0dXM9
cmVzLnN0YXR1cyw8YnI+DQrCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDC
oCDCoCDCoCDCoCBzdGFydHRpbWU9c3RhcnQsIGVuZHRpbWU9ZW5kLDxicj4NCsKgIMKgIMKgIMKg
IMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIGxhc3R0aW1lPWxhc3RfZWws
IHRoaXN0aW1lPXJlcy5lbGFwc2VkLDxicj4NCi3CoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDC
oCDCoCDCoCDCoCDCoCDCoCDCoCDCoGRlc2NyaXB0aW9uPXJlcy5kZXNjcmlwdGlvbiw8YnI+DQot
wqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqB0ZXN0X2Zp
ZWxkX3dpZHRoPXRlc3RfZmllbGRfd2lkdGgpPGJyPg0KK8KgIMKgIMKgIMKgIMKgIMKgIMKgIMKg
IMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgZGVzY3JpcHRpb249cmVzLmRlc2NyaXB0aW9uKTxi
cj4NCjxicj4NCsKgIMKgIMKgIMKgIMKgaWYgcmVzLmNhc2Vub3RydW46PGJyPg0KwqAgwqAgwqAg
wqAgwqAgwqAgwqBwcmludChyZXMuY2FzZW5vdHJ1bik8YnI+DQotLSA8YnI+DQoyLjMxLjE8YnI+
DQo8YnI+PC9ibG9ja3F1b3RlPjxkaXY+PGJyPjwvZGl2PjxkaXY+JnF1b3Q7TEdUTSZxdW90Ozxi
cj48L2Rpdj48ZGl2Pjxicj48L2Rpdj48ZGl2PlJldmlld2VkLWJ5OiBKb2huIFNub3cgJmx0Ozxh
IGhyZWY9Im1haWx0bzpqc25vd0ByZWRoYXQuY29tIj5qc25vd0ByZWRoYXQuY29tPC9hPiZndDs8
YnI+PC9kaXY+PC9kaXY+PC9kaXY+DQo=
--0000000000001aeb5c05d34c415b--


