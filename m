Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B7BB141E364
	for <lists+qemu-devel@lfdr.de>; Thu, 30 Sep 2021 23:30:51 +0200 (CEST)
Received: from localhost ([::1]:58508 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mW3di-00045r-In
	for lists+qemu-devel@lfdr.de; Thu, 30 Sep 2021 17:30:50 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39430)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1mW3bq-00038Z-GQ
 for qemu-devel@nongnu.org; Thu, 30 Sep 2021 17:28:54 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:38544)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1mW3bn-0000RU-3e
 for qemu-devel@nongnu.org; Thu, 30 Sep 2021 17:28:53 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1633037330;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type;
 bh=lHbfh/0AXnTddBTpdFrkeI/molwS4patstCwEC9O2mY=;
 b=WmwYbdQXBYe43oxTn8/X17dWLncTmqRHmkB3iHcpkSbHykpZpIBc5NyDny+1YFpB+SU+tR
 Kkxkg1LmVIC/YrTZ1mnufTNt16tXwzvbcGPtEQilWg/S25EFurk1lKfo03CUocb98pgcC3
 /mPO1Ku9LhuIEGB9tTlwbv6MAXahk9Q=
Received: from mail-ua1-f71.google.com (mail-ua1-f71.google.com
 [209.85.222.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-466-lX_WRNN1PTePj_thhhU59A-1; Thu, 30 Sep 2021 17:28:46 -0400
X-MC-Unique: lX_WRNN1PTePj_thhhU59A-1
Received: by mail-ua1-f71.google.com with SMTP id
 k22-20020ab07016000000b002c963250ef9so3692445ual.9
 for <qemu-devel@nongnu.org>; Thu, 30 Sep 2021 14:28:46 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:from:date:message-id:subject:to:cc;
 bh=lHbfh/0AXnTddBTpdFrkeI/molwS4patstCwEC9O2mY=;
 b=ozw2PcxAkxkJ1i2FlDgHoIrsMfkoYn1mBgb9/l7w2m/tXoAeZ2MC9SkJD90Xk1Pjo0
 OX00f6JpY2IOu9ozcMXwzIDhzUfZF2HlnLymbDx559UcvhYOC1Ziqqb+hzd6tsIeH00h
 3r+WliOqxfdJTzjTv65qzHl/uKPbDRckG8dIO8wEl6CbP6L9wEc86PiAGqsID5xXDfpR
 SwmIDwrTAhEuD+s+CICGsM5qBLelvsTwdHyWI8qYuTN6tT2mxSX88oAZNlrLFiW4BaE2
 0/rHfIyab/G5E5sbSvSZx7oMAOy3EC12KYUGvY3jgD8SikOO+8WGk3fWpLqgTxaYQvhd
 dY+A==
X-Gm-Message-State: AOAM532/V69TI2Wea9qu3wvoF99DpICLdgyXVf7oiS/g471yIuOnY3v3
 8f3EbBSO64IHCBTvKL1BSAzW9/bnlXVQvdEUDVE4phHDFrxQiUlnPaOTvMI4qhRsnueBqDcVs3z
 fGZ+2F1QCzSWWRzedPSN48exIunpa4Dc=
X-Received: by 2002:ab0:3c89:: with SMTP id a9mr8449632uax.32.1633037326399;
 Thu, 30 Sep 2021 14:28:46 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzytxuX3G0eFzrJJ7yCTQu2V47qwyt+COTsaG3lTbKONX+M414j8WejZu8GS4NpvIZw8Dzxo0uBz8vTCf3iR3U=
X-Received: by 2002:ab0:3c89:: with SMTP id a9mr8449600uax.32.1633037325808;
 Thu, 30 Sep 2021 14:28:45 -0700 (PDT)
MIME-Version: 1.0
From: John Snow <jsnow@redhat.com>
Date: Thu, 30 Sep 2021 17:28:35 -0400
Message-ID: <CAFn=p-bYOvg17MQ-NBDyBv_vqPgFH9MaxTO6yyKWpp1hZY4U+Q@mail.gmail.com>
Subject: Running 297 from GitLab CI
To: Kevin Wolf <kwolf@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=jsnow@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: multipart/alternative; boundary="000000000000b5c70305cd3d216a"
Received-SPF: pass client-ip=170.10.133.124; envelope-from=jsnow@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 HTML_MESSAGE=0.001, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: Hanna Reitz <hreitz@redhat.com>, qemu-devel <qemu-devel@nongnu.org>,
 qemu-block@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--000000000000b5c70305cd3d216a
Content-Type: text/plain; charset="UTF-8"

Hiya, I was talking this over with Hanna in review to '[PATCH v3 00/16]
python/iotests: Run iotest linters during Python CI' [1] and I have some
doubt about what you'd personally like to see happen, here.

In a nutshell, I split out 'linters.py' from 297 and keep all of the
iotest-bits in 297 and all of the generic "run the linters" bits in
linters.py, then I run linters.py from the GitLab python CI jobs.

I did this so that iotest #297 would continue to work exactly as it had,
but trying to serve "two masters" in the form of two test suites means some
non-beautiful design decisions. Hanna suggested we just outright drop test
297 to possibly improve the factoring of the tests.

I don't want to do that unless you give it the go-ahead, though. I wanted
to hear your feelings on if we still want to keep 297 around or not.

--js

[1] https://lists.gnu.org/archive/html/qemu-devel/2021-09/msg05787.html

--000000000000b5c70305cd3d216a
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div>Hiya, I was talking this over with Hanna in review to=
 &#39;[PATCH v3 00/16] python/iotests: Run iotest linters during Python CI&=
#39; [1] and I have some doubt about what you&#39;d personally like to see =
happen, here.</div><div><br></div><div>In a nutshell, I split out &#39;lint=
ers.py&#39; from 297 and keep all of the iotest-bits in 297 and all of the =
generic &quot;run the linters&quot; bits in linters.py, then I run linters.=
py from the GitLab python CI jobs.</div><div><br></div><div>I did this so t=
hat iotest #297 would continue to work exactly as it had, but trying to ser=
ve &quot;two masters&quot; in the form of two test suites means some non-be=
autiful design decisions. Hanna suggested we just outright drop test 297 to=
 possibly improve the factoring of the tests.<br></div><div><br></div><div>=
I don&#39;t want to do that unless you give it the go-ahead, though. I want=
ed to hear your feelings on if we still want to keep 297 around or not.<br>=
</div><div><br></div><div>--js</div><div><br></div><div>[1] <a href=3D"http=
s://lists.gnu.org/archive/html/qemu-devel/2021-09/msg05787.html">https://li=
sts.gnu.org/archive/html/qemu-devel/2021-09/msg05787.html</a></div><div><br=
></div></div>

--000000000000b5c70305cd3d216a--


