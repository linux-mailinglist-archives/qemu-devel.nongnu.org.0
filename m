Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3C9D710E92E
	for <lists+qemu-devel@lfdr.de>; Mon,  2 Dec 2019 11:51:06 +0100 (CET)
Received: from localhost ([::1]:33830 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ibjIH-00054Y-BQ
	for lists+qemu-devel@lfdr.de; Mon, 02 Dec 2019 05:51:05 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:37436)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <groug@kaod.org>) id 1ibjHQ-0004Za-2C
 for qemu-devel@nongnu.org; Mon, 02 Dec 2019 05:50:13 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <groug@kaod.org>) id 1ibjHN-0007j4-Us
 for qemu-devel@nongnu.org; Mon, 02 Dec 2019 05:50:11 -0500
Received: from 5.mo2.mail-out.ovh.net ([87.98.181.248]:35712)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <groug@kaod.org>) id 1ibjHM-0007i9-JB
 for qemu-devel@nongnu.org; Mon, 02 Dec 2019 05:50:08 -0500
Received: from player718.ha.ovh.net (unknown [10.108.16.187])
 by mo2.mail-out.ovh.net (Postfix) with ESMTP id 35CB91B7A41
 for <qemu-devel@nongnu.org>; Mon,  2 Dec 2019 11:50:05 +0100 (CET)
Received: from kaod.org (lns-bzn-46-82-253-208-248.adsl.proxad.net
 [82.253.208.248]) (Authenticated sender: groug@kaod.org)
 by player718.ha.ovh.net (Postfix) with ESMTPSA id EF757CB4B828;
 Mon,  2 Dec 2019 10:49:59 +0000 (UTC)
Date: Mon, 2 Dec 2019 11:49:58 +0100
From: Greg Kurz <groug@kaod.org>
To: Paolo Bonzini <pbonzini@redhat.com>
Subject: Re: [PATCH] docker: remove libcap development packages
Message-ID: <20191202114958.606de16f@bahia.w3ibm.bluemix.net>
In-Reply-To: <20191129150801.26654-1-pbonzini@redhat.com>
References: <20191129150801.26654-1-pbonzini@redhat.com>
X-Mailer: Claws Mail 3.17.4 (GTK+ 2.24.32; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-Ovh-Tracer-Id: 17031769367489321422
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgedufedrudejhedgvddvucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuqfggjfdqfffguegfifdpvefjgfevmfevgfenuceurghilhhouhhtmecuhedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurhepfffhvffukfgjfhfogggtgfesthejredtredtvdenucfhrhhomhepifhrvghgucfmuhhriicuoehgrhhouhhgsehkrghougdrohhrgheqnecukfhppedtrddtrddtrddtpdekvddrvdehfedrvddtkedrvdegkeenucfrrghrrghmpehmohguvgepshhmthhpqdhouhhtpdhhvghlohepphhlrgihvghrjedukedrhhgrrdhovhhhrdhnvghtpdhinhgvtheptddrtddrtddrtddpmhgrihhlfhhrohhmpehgrhhouhhgsehkrghougdrohhrghdprhgtphhtthhopehqvghmuhdquggvvhgvlhesnhhonhhgnhhurdhorhhgnecuvehluhhsthgvrhfuihiivgeptd
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
X-Received-From: 87.98.181.248
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
Cc: Fam Zheng <famz@redhat.com>,
 Alex =?UTF-8?B?QmVubsOpZQ==?= <alex.bennee@linaro.org>, berrange@redhat.com,
 qemu-devel@nongnu.org, dgilbert@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Fri, 29 Nov 2019 16:08:01 +0100
Paolo Bonzini <pbonzini@redhat.com> wrote:

> Libcap was dropped from virtio-9p, so remove it from the dockerfiles as well.
> 
> Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
> ---

Similarly to what was discussed in these threads:

20191129111632.22840-2-pbonzini@redhat.com

20191129142126.32967-1-dgilbert@redhat.com

I'm ok to take this one in my tree as well if I get an ack from Alex
or Fam.

>  tests/docker/dockerfiles/fedora.docker     | 1 -
>  tests/docker/dockerfiles/ubuntu.docker     | 1 -
>  tests/docker/dockerfiles/ubuntu1804.docker | 1 -
>  3 files changed, 3 deletions(-)
> 
> diff --git a/tests/docker/dockerfiles/fedora.docker b/tests/docker/dockerfiles/fedora.docker
> index 4ddc7dd112..47732fc5d5 100644
> --- a/tests/docker/dockerfiles/fedora.docker
> +++ b/tests/docker/dockerfiles/fedora.docker
> @@ -25,7 +25,6 @@ ENV PACKAGES \
>      libasan \
>      libattr-devel \
>      libblockdev-mpath-devel \
> -    libcap-devel \
>      libcap-ng-devel \
>      libcurl-devel \
>      libfdt-devel \
> diff --git a/tests/docker/dockerfiles/ubuntu.docker b/tests/docker/dockerfiles/ubuntu.docker
> index f486492224..ecea155646 100644
> --- a/tests/docker/dockerfiles/ubuntu.docker
> +++ b/tests/docker/dockerfiles/ubuntu.docker
> @@ -23,7 +23,6 @@ ENV PACKAGES flex bison \
>      libbrlapi-dev \
>      libbz2-dev \
>      libcacard-dev \
> -    libcap-dev \
>      libcap-ng-dev \
>      libcurl4-gnutls-dev \
>      libdrm-dev \
> diff --git a/tests/docker/dockerfiles/ubuntu1804.docker b/tests/docker/dockerfiles/ubuntu1804.docker
> index 3cc4f492c4..32a607471a 100644
> --- a/tests/docker/dockerfiles/ubuntu1804.docker
> +++ b/tests/docker/dockerfiles/ubuntu1804.docker
> @@ -12,7 +12,6 @@ ENV PACKAGES flex bison \
>      libbrlapi-dev \
>      libbz2-dev \
>      libcacard-dev \
> -    libcap-dev \
>      libcap-ng-dev \
>      libcurl4-gnutls-dev \
>      libdrm-dev \


