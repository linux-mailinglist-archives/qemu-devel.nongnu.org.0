Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 64CBA87746
	for <lists+qemu-devel@lfdr.de>; Fri,  9 Aug 2019 12:31:26 +0200 (CEST)
Received: from localhost ([::1]:58020 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.86_2)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1hw2BB-0004oi-LX
	for lists+qemu-devel@lfdr.de; Fri, 09 Aug 2019 06:31:25 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58745)
 by lists.gnu.org with esmtp (Exim 4.86_2)
 (envelope-from <philmd@redhat.com>) id 1hw29u-000436-IO
 for qemu-devel@nongnu.org; Fri, 09 Aug 2019 06:30:09 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <philmd@redhat.com>) id 1hw29n-0003YS-3i
 for qemu-devel@nongnu.org; Fri, 09 Aug 2019 06:30:04 -0400
Received: from mail-wr1-f68.google.com ([209.85.221.68]:38219)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <philmd@redhat.com>) id 1hw29l-0003WE-Dg
 for qemu-devel@nongnu.org; Fri, 09 Aug 2019 06:29:57 -0400
Received: by mail-wr1-f68.google.com with SMTP id g17so97756064wrr.5
 for <qemu-devel@nongnu.org>; Fri, 09 Aug 2019 03:29:56 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:from:to:references:openpgp:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=21DNx6pUP64Pip3rhPvcX5LACsjDHaNUmr2vca/URd0=;
 b=oj1EfKQzbJhgmkan6fs0Z5RgJ4KHZCdmfC0ALorY7HbWWSne37Kyep9h1Thr8+kHS3
 iNU4s6m3PehOZozOvgfKPbqcvCocvmTV9PzM3avvlIwMwNNwuEPyoi3H595wYqbRkcjf
 mKj8Am75h4dEBhGIZ59UzUlicUJkjCKXUQkgkz2qL7WAbUSUTDFzwzpKYrQwAziyXCbm
 arOAFghIU3NK5vl2bwPuPaxZVbHU4AWLru2gHjCjLFSkGnawWW2Wf3kXI8gJjUglidxS
 c+ir1LNWpRmuuA2kr5DGbYOllwuLmGaRmPSJdSAvvIhvp0paWAg+52BnmS4fZXYtsfNg
 HAfg==
X-Gm-Message-State: APjAAAVSVTuAU1t8y7GYsLE17j/11/kKwG4FtjjDBoJqFpq0Ci5AQut9
 7G5yBbMBS7IL65blDY5gKH1IXw==
X-Google-Smtp-Source: APXvYqwhLk6AmeExnzqjqVTpPQiqa77zrF1GO1CkCXbJQMXMl0HuG0Pye5o+5NHYW2nDYzAMZFJaBw==
X-Received: by 2002:adf:fbce:: with SMTP id d14mr1756529wrs.65.1565346595651; 
 Fri, 09 Aug 2019 03:29:55 -0700 (PDT)
Received: from [192.168.50.36] (243.red-88-26-246.staticip.rima-tde.net.
 [88.26.246.243])
 by smtp.gmail.com with ESMTPSA id p7sm69304227wrs.6.2019.08.09.03.29.54
 (version=TLS1_3 cipher=AEAD-AES128-GCM-SHA256 bits=128/128);
 Fri, 09 Aug 2019 03:29:55 -0700 (PDT)
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
To: Markus Armbruster <armbru@redhat.com>, qemu-devel@nongnu.org,
 =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>
References: <20190809064645.22656-1-armbru@redhat.com>
 <20190809064645.22656-21-armbru@redhat.com>
 <c76aaebc-d4bf-cb25-fe27-7a9c9ba644c9@redhat.com>
Openpgp: id=89C1E78F601EE86C867495CBA2A3FD6EDEADC0DE;
 url=http://pgp.mit.edu/pks/lookup?op=get&search=0xA2A3FD6EDEADC0DE
Message-ID: <7f824b69-d506-e6ad-8fa9-3d3c232db02c@redhat.com>
Date: Fri, 9 Aug 2019 12:29:54 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.0
MIME-Version: 1.0
In-Reply-To: <c76aaebc-d4bf-cb25-fe27-7a9c9ba644c9@redhat.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
X-Received-From: 209.85.221.68
Subject: Re: [Qemu-devel] [PATCH v3 20/29] Include qemu/main-loop.h less
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 8/9/19 11:42 AM, Philippe Mathieu-Daudé wrote:
[...]
> netmap failing again :S
> 
> $ make docker-image-debian-amd64 V=1 DEBUG=1
> [...]
>   CC      net/netmap.o
> net/netmap.c: In function 'netmap_update_fd_handler':
> net/netmap.c:109:5: error: implicit declaration of function
> 'qemu_set_fd_handler' [-Werror=implicit-function-declaration]
>      qemu_set_fd_handler(s->nmd->fd,
>      ^~~~~~~~~~~~~~~~~~~
> net/netmap.c:109:5: error: nested extern declaration of
> 'qemu_set_fd_handler' [-Werror=nested-externs]

Since it might not be obvious to see how helpful/powerful is Docker, I
gathered few notes (already posted once) about how I use it (often
bisecting).

# Automatically create a base image (the image is then cached)
$ make docker-image-debian-s390x-cross

# Create a out-of-tree build directory
$ mkdir build/docker_s390x

# Run ./configure
#
# --rm  : Use a temp copy of the base image (do not modify it)
# -v ...: Mount the current directory within the container
# -w ...: Start the shell in the out-of-tree directory
# -u ...: Use same UID as my user so I can remove the files after
# $QEMU_CONFIGURE_OPTS contains the cross-compile options
#
$ docker run --rm \
  -v $PWD:$PWD \
  -w $PWD/build/docker_s390x \
  -u $UID \
  qemu:debian-s390x-cross \
    \
    sh -c "../../configure \$QEMU_CONFIGURE_OPTS"

I use 'sh -c' to escape $QEMU_CONFIGURE_OPTS, there might be a cleaner
way to do this.

# Stupid step to speed up bisection
# This will:
# - clone submodules if necessary
# - build slirp
# - build fdt
# - build capstone
# - generated bunch of headers
# - generated bunch of trace files
$ docker run --rm \
  -v $PWD:$PWD \
  -w $PWD/build/docker_s390x \
  -u $UID \
  qemu:debian-s390x-cross \
    \
    make stubs/qtest.o

Now the directory is ready for building/bisecting.

I.e. build a single file:

$ docker run --rm \
  -v $PWD:$PWD \
  -w $PWD/build/docker_s390x \
  -u $UID \
  qemu:debian-s390x-cross \
    \
    make -C s390x-softmmu hw/intc/s390_flic_kvm.o

make: Entering directory 'build/docker_s390x/s390x-softmmu'
  CC      hw/intc/s390_flic_kvm.o
hw/intc/s390_flic_kvm.c: In function 'kvm_flic_save':
hw/intc/s390_flic_kvm.c:395:9: error: implicit declaration of function
'qemu_put_be64' [-Werror=implicit-function-declaration]
         qemu_put_be64(f, FLIC_FAILED);
         ^~~~~~~~~~~~~
hw/intc/s390_flic_kvm.c:395:9: error: nested extern declaration of
'qemu_put_be64' [-Werror=nested-externs]
hw/intc/s390_flic_kvm.c:410:9: error: implicit declaration of function
'qemu_put_buffer' [-Werror=implicit-function-declaration]
         qemu_put_buffer(f, (uint8_t *) buf,
         ^~~~~~~~~~~~~~~
hw/intc/s390_flic_kvm.c:410:9: error: nested extern declaration of
'qemu_put_buffer' [-Werror=nested-externs]
hw/intc/s390_flic_kvm.c: In function 'kvm_flic_load':
hw/intc/s390_flic_kvm.c:438:13: error: implicit declaration of function
'qemu_get_be64' [-Werror=implicit-function-declaration]
     count = qemu_get_be64(f);
             ^~~~~~~~~~~~~
hw/intc/s390_flic_kvm.c:438:5: error: nested extern declaration of
'qemu_get_be64' [-Werror=nested-externs]
     count = qemu_get_be64(f);
     ^~~~~
hw/intc/s390_flic_kvm.c:454:9: error: implicit declaration of function
'qemu_get_buffer' [-Werror=implicit-function-declaration]
     if (qemu_get_buffer(f, (uint8_t *) buf, len) != len) {
         ^~~~~~~~~~~~~~~
hw/intc/s390_flic_kvm.c:454:5: error: nested extern declaration of
'qemu_get_buffer' [-Werror=nested-externs]
     if (qemu_get_buffer(f, (uint8_t *) buf, len) != len) {
     ^~
cc1: all warnings being treated as errors
rules.mak:69: recipe for target 'hw/intc/s390_flic_kvm.o' failed
make: *** [hw/intc/s390_flic_kvm.o] Error 1
make: Leaving directory 'build/docker_s390x/s390x-softmmu'

Hope that help!

Regards,

Phil.

