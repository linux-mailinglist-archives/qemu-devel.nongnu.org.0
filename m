Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 529F15A4F1E
	for <lists+qemu-devel@lfdr.de>; Mon, 29 Aug 2022 16:26:08 +0200 (CEST)
Received: from localhost ([::1]:36098 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oSfiI-0004oz-Vp
	for lists+qemu-devel@lfdr.de; Mon, 29 Aug 2022 10:26:07 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40728)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1oSfgG-0003Rh-LP
 for qemu-devel@nongnu.org; Mon, 29 Aug 2022 10:24:00 -0400
Received: from mail-qt1-x831.google.com ([2607:f8b0:4864:20::831]:35709)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1oSfgF-0000EW-6X
 for qemu-devel@nongnu.org; Mon, 29 Aug 2022 10:24:00 -0400
Received: by mail-qt1-x831.google.com with SMTP id h22so6219235qtu.2
 for <qemu-devel@nongnu.org>; Mon, 29 Aug 2022 07:23:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc;
 bh=/A8l+E2BHtR0HZ3XBHZNd3S66OVaMwWUiXswOQyiKAo=;
 b=ghaWUaF33VYnU6HAl7MXuzHDt8fueNZoCjGAadZ/5lbtPMnVTCfeTwZkguusH9+lIk
 HJkKcqrIYC+anfpwOo82LG9tpuh0UeBq2V7dEQnmRE7dkySNH2rMS8ojzAeDKTS2g93f
 XWPy+eeG/wqP985l6mBVwOnMgn6PDo4v/WI5oof+RMBAMr3YoQCUet/rr/DZPd/uuR3w
 yMTb8vn8/i5aNHJSAv8fmk5gZSicQBGpdLUrt3OLKe/8+dOg5Ku62wnB8WhSoaobP//x
 dt7rAkSMVWQ69sqmIdorey8n+V3xvY6lmKgW0U66lb7HOEpMipjFjEsZ+1N810hKS7Hy
 YC7A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc;
 bh=/A8l+E2BHtR0HZ3XBHZNd3S66OVaMwWUiXswOQyiKAo=;
 b=FQ5tZ9uAz6YqIjQAHcEb3L07UEtJ3ixDJWubMtGcRTTFZ+0WXK5pD1SWxIflifggEb
 55NFJ+XeiSW+10ezoUFQkqXHWy3WkR8uJIeTEFxYgagFCji5AGg9RzUKob+iATF/hpBb
 Xwjsa5hBuLDj4gOrCEBZScl5V3kKU1HYG3sEEhZ4/ReDlSQrfRBFjyEDG+7QxVqcVo7Y
 wHLmFi8j4xfwUpXQOEZoOPNCskTLM14KRSl8E9JRLtZDpDJ/g/q5/rUottV28PZhMkt/
 lHp8ffh4ohgKD+VeflCafG6vU0kp0m9TOzL3NQlwWOdKGmxLChWQp4yFewobnVSIFFX8
 WTYQ==
X-Gm-Message-State: ACgBeo2jVa/oDH3POM2yn13zDetXMs3OIKstn4Z1fRzr4NbV3DUVXfeG
 5ZI/TETxAH8ILrqnk5yWvhkaxGX0doc15ge1muryWdyl
X-Google-Smtp-Source: AA6agR6v9v5hKPU70Ledpwd+dDXDKoMnPHbbnX/VloAGMW+aiU8CTRnYngPUlCASOzfV7184M9PADs6QIn3A8WkaK1Y=
X-Received: by 2002:ac8:574e:0:b0:344:555f:cbe4 with SMTP id
 14-20020ac8574e000000b00344555fcbe4mr10511097qtx.276.1661783038092; Mon, 29
 Aug 2022 07:23:58 -0700 (PDT)
MIME-Version: 1.0
References: <20220824094029.1634519-1-bmeng.cn@gmail.com>
 <20220824094029.1634519-23-bmeng.cn@gmail.com>
 <87y1v7nqe9.fsf@pond.sub.org>
In-Reply-To: <87y1v7nqe9.fsf@pond.sub.org>
From: Bin Meng <bmeng.cn@gmail.com>
Date: Mon, 29 Aug 2022 22:23:47 +0800
Message-ID: <CAEUhbmVryzMRNJiOzev6cjHCN2FBNHEYqCwhcwh0P0HuymHX8A@mail.gmail.com>
Subject: Re: [PATCH 22/51] tests/qtest: qmp-test: Skip running test_qmp_oob
 for win32
To: Markus Armbruster <armbru@redhat.com>
Cc: "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
 Bin Meng <bin.meng@windriver.com>, 
 Laurent Vivier <lvivier@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Thomas Huth <thuth@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::831;
 envelope-from=bmeng.cn@gmail.com; helo=mail-qt1-x831.google.com
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

Hi Markus,

On Mon, Aug 29, 2022 at 9:14 PM Markus Armbruster <armbru@redhat.com> wrote:
>
> Bin Meng <bmeng.cn@gmail.com> writes:
>
> > From: Bin Meng <bin.meng@windriver.com>
> >
> > The test_qmp_oob test case calls mkfifo() which does not exist on
> > win32. Exclude it.
> >
> > Signed-off-by: Bin Meng <bin.meng@windriver.com>
> > ---
> >
> >  tests/qtest/qmp-test.c | 6 ++++++
> >  1 file changed, 6 insertions(+)
> >
> > diff --git a/tests/qtest/qmp-test.c b/tests/qtest/qmp-test.c
> > index b950dbafaf..4a165447f8 100644
> > --- a/tests/qtest/qmp-test.c
> > +++ b/tests/qtest/qmp-test.c
> > @@ -159,6 +159,8 @@ static void test_qmp_protocol(void)
> >      qtest_quit(qts);
> >  }
> >
> > +#ifndef _WIN32
> > +
> >  /* Out-of-band tests */
> >
> >  char *tmpdir;
> > @@ -279,6 +281,8 @@ static void test_qmp_oob(void)
> >      qtest_quit(qts);
> >  }
> >
> > +#endif /* _WIN32 */
> > +
> >  /* Preconfig tests */
> >
> >  static void test_qmp_preconfig(void)
> > @@ -338,7 +342,9 @@ int main(int argc, char *argv[])
> >      g_test_init(&argc, &argv, NULL);
> >
> >      qtest_add_func("qmp/protocol", test_qmp_protocol);
> > +#ifndef _WIN32
> >      qtest_add_func("qmp/oob", test_qmp_oob);
> > +#endif
> >      qtest_add_func("qmp/preconfig", test_qmp_preconfig);
> >      qtest_add_func("qmp/missing-any-arg", test_qmp_missing_any_arg);
>
> I'd appreciate a comment explaining why we have to disable this test on
> Windows.

The reason is explained in the commit message.

Regards,
Bin

