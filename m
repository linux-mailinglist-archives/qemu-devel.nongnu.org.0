Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 888A64C2E6B
	for <lists+qemu-devel@lfdr.de>; Thu, 24 Feb 2022 15:29:17 +0100 (CET)
Received: from localhost ([::1]:40838 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nNF7M-0000U3-5U
	for lists+qemu-devel@lfdr.de; Thu, 24 Feb 2022 09:29:16 -0500
Received: from eggs.gnu.org ([209.51.188.92]:48036)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nNF4s-00081y-FM
 for qemu-devel@nongnu.org; Thu, 24 Feb 2022 09:26:42 -0500
Received: from [2607:f8b0:4864:20::1132] (port=32794
 helo=mail-yw1-x1132.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nNF4p-00035i-9O
 for qemu-devel@nongnu.org; Thu, 24 Feb 2022 09:26:42 -0500
Received: by mail-yw1-x1132.google.com with SMTP id
 00721157ae682-2d66f95f1d1so27661987b3.0
 for <qemu-devel@nongnu.org>; Thu, 24 Feb 2022 06:26:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=zEbvxUFIIIs6i7LXcE8JA127fKusI9PNR08fFae2zjs=;
 b=py5fma2Vc+kq+QGVBi7zvYAAwLeZOg9xIxR+9fdpOa0+k1mox326yHLJgcy+hOUcjt
 +9hji15x1wFbhD3SaGYPkw2IVuJJ3f6qCH0F7fvAvFTk7Z+Jr0nB8/Gg6XN2EXK2DIwQ
 88kETqmP5j9qsJKREE0YYLhfrHphHAHE8f1DYLaxUi6HCr64dqI3iMAWQ9WK+ndshc5p
 Ysh76An547vOH16jDRyC2Sj76KoDun02xLID+aAQaNydUt1w6DOI0WxopLmHhOvtVEcz
 Vr2m/6jrTbM1enZ2t/0YsLUxVlN/Blk1lEUuc2T5Pt2u98O1fRpiYa3Y9prZmlrELqWo
 4pXg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=zEbvxUFIIIs6i7LXcE8JA127fKusI9PNR08fFae2zjs=;
 b=jlAZMvNDTvtSDbfgWXUT7jUTp9tyqe4FiU+5YXRzWC15AZy4B6tqwefjU7mCcFmBgN
 W+5Hm1KVW1qbBYUgbIWYAoKloOFqOI0M/JaqCKxZ+rVuP8qOe02Rqs2KZTo0J6XJZN+4
 h1n9CfwrCBck494nAmHpMHSbIoNYPaBGJ4vAwOXsS5RneLh73MEVL7VxgTiH4LibXr6V
 RZpbkapNsdK+h8yCUSZAohTQQDTTbzHBSMZB1K068oSMm+m8BuVhH3wbljQTWlvl3il2
 k2hbquT/anfUAiFiBXVWBVlTHjPmLDYyyVsCPoTSxkpX5GFjRQ2Ce3cSddlwu84Miyv4
 eqyQ==
X-Gm-Message-State: AOAM532Awc7ORw0lsH0b5TlXeDM0rdNILdnkgBgbr48iDGtc4a/0KWSu
 mWAn+b/IHEnJu8zFoowbdlGSl2bWnyta+VbsHqXoyA==
X-Google-Smtp-Source: ABdhPJwcIiJQ0AWaDkXFE6/fcdQRzU9UAyTFDti5N0eCdL5VyPgoqWbnoe3LU+eTFqmUo/S4gYhhTGOi7n4VPPehmSU=
X-Received: by 2002:a81:a748:0:b0:2d6:1f8b:23a9 with SMTP id
 e69-20020a81a748000000b002d61f8b23a9mr2609461ywh.329.1645712798057; Thu, 24
 Feb 2022 06:26:38 -0800 (PST)
MIME-Version: 1.0
References: <20220222152341.850419-1-peter.maydell@linaro.org>
 <20220222152341.850419-3-peter.maydell@linaro.org>
 <90aa45dd-9fe2-cb66-281a-1e397f8cbeed@redhat.com>
In-Reply-To: <90aa45dd-9fe2-cb66-281a-1e397f8cbeed@redhat.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 24 Feb 2022 14:26:26 +0000
Message-ID: <CAFEAcA-3B_D9vA99uB2Wqtn_FsdbwdNa0DRqa87bC5xOfWzY=A@mail.gmail.com>
Subject: Re: [PATCH v2 2/2] block/curl.c: Check error return from
 curl_easy_setopt()
To: Hanna Reitz <hreitz@redhat.com>
Content-Type: text/plain; charset="UTF-8"
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::1132
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::1132;
 envelope-from=peter.maydell@linaro.org; helo=mail-yw1-x1132.google.com
X-Spam_score_int: -6
X-Spam_score: -0.7
X-Spam_bar: /
X-Spam_report: (-0.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 PDS_HP_HELO_NORDNS=0.659, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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
Cc: Kevin Wolf <kwolf@redhat.com>, qemu-devel@nongnu.org, qemu-block@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Thu, 24 Feb 2022 at 14:11, Hanna Reitz <hreitz@redhat.com> wrote:
>
> On 22.02.22 16:23, Peter Maydell wrote:
> > Coverity points out that we aren't checking the return value
> > from curl_easy_setopt() for any of the calls to it we make
> > in block/curl.c.
> >
> > Some of these options are documented as always succeeding (e.g.
> > CURLOPT_VERBOSE) but others have documented failure cases (e.g.
> > CURLOPT_URL).  For consistency we check every call, even the ones
> > that theoretically cannot fail.
> >
> > Fixes: Coverity CID 1459336, 1459482, 1460331
> > Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
> > ---
> > Changes v1->v2:
> >   * set the error string in the failure path for the
> >     direct setopt calls in curl_open()
> >   * fix the failure path in curl_setup_preadv() by putting
> >     the curl_easy_setopt() call in the same if() condition
> >     as the existing curl_multi_add_handle()
> > ---
> >   block/curl.c | 92 +++++++++++++++++++++++++++++++++-------------------
> >   1 file changed, 58 insertions(+), 34 deletions(-)
>
> Reviewed-by: Hanna Reitz <hreitz@redhat.com>

For the record, I had a late thought that maybe we were setting
some optional-for-us options that were only added in later versions
of libcurl and accidentally relying on not checking the error code.
But it turns out this isn't the case: most of the options we set
are always supported, and the exceptions are:
 NOSIGNAL -- 7.10 onward
 PRIVATE -- 7.10.3 onward
 USERNAME, PASSWORD, PROXYUSERNAME, PROXYPASSWORD -- 7.19.1 onward,
  but we only set these if the user asked for them, so failing
  would be the right thing anyway
 PROTOCOLS, REDIR_PROTOCOLS -- 7.19.4 onward, guarded by a
  compile-time LIBCURL_VERSION_NUM check

And in any case our meson.build insists on at least 7.29.
(That means we could drop the LIBCURL_VERSION_NUM guards, I guess.)

-- PMM

