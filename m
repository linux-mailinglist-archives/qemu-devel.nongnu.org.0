Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 42A2E2F4DFC
	for <lists+qemu-devel@lfdr.de>; Wed, 13 Jan 2021 15:56:50 +0100 (CET)
Received: from localhost ([::1]:46520 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kzhZp-0002PI-9J
	for lists+qemu-devel@lfdr.de; Wed, 13 Jan 2021 09:56:49 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:59448)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1kzhYH-0001Ql-55
 for qemu-devel@nongnu.org; Wed, 13 Jan 2021 09:55:14 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:39090)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1kzhYE-0008Dr-9x
 for qemu-devel@nongnu.org; Wed, 13 Jan 2021 09:55:12 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1610549708;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=CLd/WXwdjT5cP1gWYDLLpybstoqjbmr8k0cyvRWDzvE=;
 b=bFVnhtAtjIQqw350tMpXQWiXzJsSNZ2i35Wik8USSrROZTx8o2WOLChNPuZxAvDwmIm5+G
 6AjTh81qP8XMH2wckW+zGK0bd9c9CpjVucu98qelDzjOSsB+s7sOW37m0kA5S3gWeXTPWP
 R8bwYG2swb8q52snwgTbTiuk+AXY7kk=
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com
 [209.85.214.198]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-149-agJmZy0pM9SxSR-kDdW5qQ-1; Wed, 13 Jan 2021 09:55:06 -0500
X-MC-Unique: agJmZy0pM9SxSR-kDdW5qQ-1
Received: by mail-pl1-f198.google.com with SMTP id l11so1395769plt.2
 for <qemu-devel@nongnu.org>; Wed, 13 Jan 2021 06:55:06 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=CLd/WXwdjT5cP1gWYDLLpybstoqjbmr8k0cyvRWDzvE=;
 b=IQdWj2AOs1Zv/UE/AXOjV9JLljr5xrTw/kLocubhbxq+Pf9DJVjNhsYNvU9K/vHdLg
 QsR4HbMkCxF9uHYMDC6FnFMZ0CrwCIqbbL8DnFjOZSD52LHCzHsUjch+EC0A0n/6+WYa
 7PJsat6H4rlrEAUxsaH9rGgchMQ+qVumaC3udn3cU2lshtcS2PQXMkD35n8ivuQPzV2d
 7GpnAN/0chSfDAozBpydzYOWPP9+A3AJ4RJK2w+Dy/4tyg7Sjahs1dlkVSXdOiLNoWTB
 5+lAGCdRrM7aWamLNDr56auwch8cNi9tWaWmZToGnffM51TNDM/SLfYwLK/MG4+4sXVE
 luLg==
X-Gm-Message-State: AOAM530kKQQRRFySC5QN73MbvCYDGIxC+O8eKlMe1BlKbfR/IYkqV85v
 UR46ZX5KtwK/LhSNqRvLoBdJuGVhhE38KN+NmVrkkoJFpHukmm5w1Qsw5PgYgobHVbSHmwNh90F
 FJh8j94fYGjsdTGxBHHeEk1bQY+gFapI=
X-Received: by 2002:a63:1f47:: with SMTP id q7mr2456450pgm.10.1610549705232;
 Wed, 13 Jan 2021 06:55:05 -0800 (PST)
X-Google-Smtp-Source: ABdhPJx0uniXdc4CbpfCY03qcR2i91KDCKKOuev3RuONceABU1hrIWORbXbghEKMgPHTz06nOyIfho1EvU9XVoSYgA0=
X-Received: by 2002:a63:1f47:: with SMTP id q7mr2456431pgm.10.1610549704951;
 Wed, 13 Jan 2021 06:55:04 -0800 (PST)
MIME-Version: 1.0
References: <20201027132015.621733-1-berrange@redhat.com>
In-Reply-To: <20201027132015.621733-1-berrange@redhat.com>
From: Paolo Bonzini <pbonzini@redhat.com>
Date: Wed, 13 Jan 2021 15:54:51 +0100
Message-ID: <CABgObfZ+grQAax+dAJ626kTSHrC8mzwu9CPjNHcNaRxbbn7C7w@mail.gmail.com>
Subject: Re: [qemu-web PATCH v2 00/16] Re-design the QEMU home page to better
 present information
To: =?UTF-8?Q?Daniel_P=2E_Berrang=C3=A9?= <berrange@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=pbonzini@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=216.205.24.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.25,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: Thomas Huth <thuth@redhat.com>, qemu-devel <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

I am going to apply patches 1-3, so that I can play with doing the
final deployment via gitlab pipelines.

On Tue, Oct 27, 2020 at 2:20 PM Daniel P. Berrang=C3=A9 <berrange@redhat.co=
m> wrote:
>
> This is a v2 of:
>
>   https://lists.gnu.org/archive/html/qemu-devel/2020-10/msg07025.html
>
> This series started off as a desire to add an "Edit page" link to every
> page on the site. In doing this I felt that the footer would benefit
> from simplication so that it was not a massive wall of links,
> duplicating links elsewhere in the navigation or content pages. Then
> after response to v1, I realized that the home page actually needed
> alot more design work to better present information to contributors
> immediately.
>
> The key theme was to ensure that the home page of the website has all
> the important information available on screen without requiring the
> user to scroll down or otherwise search for it.
>
> I also add gitlab CI jobs so that users can push a branch to gitlab and
> then browse the rendered result.
>
> eg see this pipeline:
>
>   https://gitlab.com/berrange/qemu-web/-/pipelines/208194087
>
> and the rendered result of this series:
>
>   https://berrange.gitlab.io/qemu-web/
>
> Or browsable at
>
>   https://gitlab.com/berrange/qemu-web/-/jobs/814392582/artifacts/browse/=
publ=3D
> ic/
>
> Or download ZIP at
>
>   https://gitlab.com/berrange/qemu-web/-/jobs/814392582/artifacts/downloa=
d
>
> notice how the resulting content needs to cope with being used from a
> variety of different paths. IOW, we cannot use absolute hyperlinks that
> assume the root is "/".  Jekyll doesn't make this easy, so we use a hack
> with a custom template that sets a variable we can then reference.
>
> The logical next step for this would be to accept merge requests, so
> that once the user saves their edits in gitlab, they can directly submit
> a MR, instead of sending via email.  I noticed we don't currently have a
> CONTRIBUTING.md file in qemu-web.git telling people how to submit. So
> this series includes such a file directing people to send patches via
> email for now.
>
> Daniel P. Berrang=3DC3=3DA9 (16):
>   Convert files to UNIX line endings
>   gitlab: introduce a CI job to publish the site content
>   make all links be relative to the root
>   Make page header nav narrower
>   Introduce support for "bxslider" jquery add on
>   Rework display of screenshots to use a carousel slider
>   Compress the two front page headings into one
>   Simplify copyright and integrate into footer
>   Put a full SFC membership blurb in footer of every page
>   Use two column layout to display screenshots and releases
>   Bring contribution links out of the footer into the home page
>   Add recent blog posts to the front page featured content
>   Move wiki link from footer into the header navbar
>   Simplify and restructure the page footer
>   Add link to "page source" for all pages
>   Add a CONTRIBUTING.md file as guidance for contributors
>
>  .gitlab-ci.yml                 |   16 +
>  CONTRIBUTING.md                |   32 +
>  _config.yml                    |    1 +
>  _data/screenshots.yml          |   14 +-
>  _includes/assets.html          |   32 +-
>  _includes/copyright.html       |    8 -
>  _includes/footer.html          |   33 +-
>  _includes/nav.html             |   13 +-
>  _includes/relative_root.html   |   12 +
>  _includes/screenshot.html      |    8 +-
>  _includes/sidebar.html         |    6 +-
>  _layouts/archive.html          |    4 +-
>  _layouts/blog.html             |    4 +-
>  _layouts/home.html             |    2 +-
>  _layouts/page.html             |    2 +-
>  assets/css/jquery.bxslider.css |  179 ++++
>  assets/css/style-desktop.css   |  581 ++++++------
>  assets/css/style-mobile.css    |  720 +++++++-------
>  assets/css/style.css           | 1252 +++++++++++++------------
>  assets/js/jquery.bxslider.js   | 1607 ++++++++++++++++++++++++++++++++
>  blog/index.html                |    4 +-
>  index.html                     |  195 ++--
>  22 files changed, 3312 insertions(+), 1413 deletions(-)
>  create mode 100644 .gitlab-ci.yml
>  create mode 100644 CONTRIBUTING.md
>  delete mode 100644 _includes/copyright.html
>  create mode 100644 _includes/relative_root.html
>  create mode 100644 assets/css/jquery.bxslider.css
>  create mode 100644 assets/js/jquery.bxslider.js
>
> --=3D20
> 2.26.2
>
>


