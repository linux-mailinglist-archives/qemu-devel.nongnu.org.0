Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0339E92525
	for <lists+qemu-devel@lfdr.de>; Mon, 19 Aug 2019 15:35:51 +0200 (CEST)
Received: from localhost ([::1]:51492 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1hzhp8-0008AP-42
	for lists+qemu-devel@lfdr.de; Mon, 19 Aug 2019 09:35:50 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55011)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <aleksandar.m.mail@gmail.com>) id 1hzho5-0007Eb-Gb
 for qemu-devel@nongnu.org; Mon, 19 Aug 2019 09:34:48 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <aleksandar.m.mail@gmail.com>) id 1hzho2-0004xQ-O3
 for qemu-devel@nongnu.org; Mon, 19 Aug 2019 09:34:45 -0400
Received: from mail-ot1-x341.google.com ([2607:f8b0:4864:20::341]:41417)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <aleksandar.m.mail@gmail.com>)
 id 1hzho0-0004vB-Ha; Mon, 19 Aug 2019 09:34:42 -0400
Received: by mail-ot1-x341.google.com with SMTP id o101so1645222ota.8;
 Mon, 19 Aug 2019 06:34:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=6rZXSUjy8S5bH/vr9XphUdRgnH3ZewgtxVYrYkVE7mA=;
 b=RjCCBX2RcuE63K0p2uhGFbezKYE7DAtw1QJGos+QCrd+HAVzmVJNjsr73//uWhp5CN
 YrmZJ/yMXzJCO+PaK1i63d4L01YLimUFDvy4DIsSdcKo8mlogf++kM9q6FbVw8bkRKYr
 LNDzIKNDSfpT2x9Pin9o4whodkmVR82/Bk0nL2/XKPXy0mKNjTqD/TdrlMH6eYtQ6Vsn
 yvpJy7TMa4I0EM6g9vI5gh21My8KnMGCkWbiW5gkGpEjSW5C9jsqNbrFt9IZPnM74riC
 msN4XjZs1sHuWHxmB3tspTVS2IirKnZTvb2vRykKcQhBOWFBGI1nq3Tiii8zYCb6qg7/
 UmkQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=6rZXSUjy8S5bH/vr9XphUdRgnH3ZewgtxVYrYkVE7mA=;
 b=POxh4lVukI2mcKfAfYOpGtmTUp4fFGx4KWgW7y4Mh1aBSRG90JpnxAnYNhU3EU9771
 M/uiGmF3B/ITB5WVlMdQqTqmlwQjFxK3NCtY3ZWmoerOWY7c3iVBjlJHJ3A5dXEblzYO
 EkgsvRsf1aqtcI73Z2KeZ43q51XbOPVOkhSIO/V4GBmknIUPuZmjdoJe+9qLiOOcWn+v
 CTZuQssliMUbaKCdZUVT6DOeHyXX2mFB33sJzJjIhkc4h+vd6qzeT7ENvTl/eaKRATLd
 vzI/BBSVTvdkh/CjGgaecczd7XQjUj3gorD+N/rnZ8fUWpPY1IAPUSxuFeYuXtF6Jv2J
 4cjw==
X-Gm-Message-State: APjAAAUDXt13XN5SOY8eAMFDgZSLNl4ruzlCIqkhrAiqT8kNmb9Bfw9q
 KpO/JFczhFHK3bCoWE6XQ3pkgyLs84Y/gxequME=
X-Google-Smtp-Source: APXvYqy4PxQC7gtt5i05JBGjAgcZAn5tIhwrEqtZyw54J1BI2iKtbaV/mOgcyinYaEvvqqWFVRh/BvAqerv8/lKRoLw=
X-Received: by 2002:a05:6830:4d6:: with SMTP id
 s22mr950815otd.295.1566221679082; 
 Mon, 19 Aug 2019 06:34:39 -0700 (PDT)
MIME-Version: 1.0
References: <8fb538f3-dfdd-b427-727a-2e7c2120da09@gmail.com>
 <20e800e8-846b-a9c3-f840-826238b0818f@redhat.com>
 <CAFEAcA9xbPGSezS60cg6WzqpDR1u38aE0bXL_6pLs+H1TK3Ddw@mail.gmail.com>
 <dff44ac1-10e7-285e-467d-8dfe8c7a469b@redhat.com>
In-Reply-To: <dff44ac1-10e7-285e-467d-8dfe8c7a469b@redhat.com>
From: Aleksandar Markovic <aleksandar.m.mail@gmail.com>
Date: Mon, 19 Aug 2019 15:34:27 +0200
Message-ID: <CAL1e-=hD03RDSHhaBK1BVScKSRsrkXy-dJCvUFzfpJCbYSVe9w@mail.gmail.com>
To: David Hildenbrand <david@redhat.com>
Content-Type: multipart/mixed; boundary="000000000000d25f4e05907866f1"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::341
X-Content-Filtered-By: Mailman/MimeDel 2.1.23
Subject: Re: [Qemu-devel] [qemu-s390x] linux-user: s390x issue on Fedora 30
 (dynamic library loader?)
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
Cc: Peter Maydell <peter.maydell@linaro.org>, Cornelia Huck <cohuck@redhat.com>,
 Riku Voipio <riku.voipio@iki.fi>,
 Richard Henderson <richard.henderson@linaro.org>,
 "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>,
 Laurent Vivier <laurent@vivier.eu>, qemu-s390x <qemu-s390x@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--000000000000d25f4e05907866f1
Content-Type: text/plain; charset="UTF-8"

Hi, David.

I can't repro the problem either, but I do have a patch authored by an
engineer that left the company a while ago that seems to be at least
related to your scenario. May I ask you to test it (just apply it to QEMU
ToT and rerun the scenario to see if it changes the outcome) (feel free to
experiment and modify the changes)? I never managed to understand the
purpose of that patch (I lost the contact with the former engineer, and the
patch is without any comment), so I never dared to send it to the list, but
I hope your scenario may actually explain the purpose and the origin of the
patch.

I am attaching the patch both as a file and inline.

Yours,
Aleksandar


From 377f99e807f4aa42ece9f0cd437f50af11611b4c Mon Sep 17 00:00:00 2001
From: Aleksandar Markovic <amarkovic@wavecomp.com>
Date: Mon, 19 Aug 2019 15:20:29 +0200
Subject: [PATCH] linux-user: Special case /etc/ld.cache.so and pretend it
does
 not exist

Prevent target executables from opening host ld.so.cache.
---
 linux-user/syscall.c | 28 ++++++++++++++++++++++++++++
 1 file changed, 28 insertions(+)

diff --git a/linux-user/syscall.c b/linux-user/syscall.c
index 8367cb1..f5bae6e 100644
--- a/linux-user/syscall.c
+++ b/linux-user/syscall.c
@@ -8820,6 +8820,10 @@ static abi_long do_syscall1(void *cpu_env, int num,
abi_long arg1,
         if (!(p = lock_user_string(arg1))) {
             return -TARGET_EFAULT;
         }
+        if (strcmp("/etc/ld.so.cache", path(p)) == 0) {
+            unlock_user(p, arg1, 0);
+            return -TARGET_ENONET;
+        }
         ret = get_errno(statfs(path(p), &stfs));
         unlock_user(p, arg1, 0);
     convert_statfs:
@@ -8859,6 +8863,10 @@ static abi_long do_syscall1(void *cpu_env, int num,
abi_long arg1,
         if (!(p = lock_user_string(arg1))) {
             return -TARGET_EFAULT;
         }
+        if (strcmp("/etc/ld.so.cache", path(p)) == 0) {
+            unlock_user(p, arg1, 0);
+            return -TARGET_ENONET;
+        }
         ret = get_errno(statfs(path(p), &stfs));
         unlock_user(p, arg1, 0);
     convert_statfs64:
@@ -9059,6 +9067,10 @@ static abi_long do_syscall1(void *cpu_env, int num,
abi_long arg1,
         if (!(p = lock_user_string(arg1))) {
             return -TARGET_EFAULT;
         }
+        if (strcmp("/etc/ld.so.cache", path(p)) == 0) {
+            unlock_user(p, arg1, 0);
+            return -TARGET_ENONET;
+        }
         ret = get_errno(stat(path(p), &st));
         unlock_user(p, arg1, 0);
         goto do_stat;
@@ -9068,6 +9080,10 @@ static abi_long do_syscall1(void *cpu_env, int num,
abi_long arg1,
         if (!(p = lock_user_string(arg1))) {
             return -TARGET_EFAULT;
         }
+        if (strcmp("/etc/ld.so.cache", path(p)) == 0) {
+            unlock_user(p, arg1, 0);
+            return -TARGET_ENONET;
+        }
         ret = get_errno(lstat(path(p), &st));
         unlock_user(p, arg1, 0);
         goto do_stat;
@@ -10268,6 +10284,10 @@ static abi_long do_syscall1(void *cpu_env, int
num, abi_long arg1,
         if (!(p = lock_user_string(arg1))) {
             return -TARGET_EFAULT;
         }
+        if (strcmp("/etc/ld.so.cache", path(p)) == 0) {
+            unlock_user(p, arg1, 0);
+            return -TARGET_ENONET;
+        }
         ret = get_errno(stat(path(p), &st));
         unlock_user(p, arg1, 0);
         if (!is_error(ret))
@@ -10279,6 +10299,10 @@ static abi_long do_syscall1(void *cpu_env, int
num, abi_long arg1,
         if (!(p = lock_user_string(arg1))) {
             return -TARGET_EFAULT;
         }
+        if (strcmp("/etc/ld.so.cache", path(p)) == 0) {
+            unlock_user(p, arg1, 0);
+            return -TARGET_ENONET;
+        }
         ret = get_errno(lstat(path(p), &st));
         unlock_user(p, arg1, 0);
         if (!is_error(ret))
@@ -10319,6 +10343,10 @@ static abi_long do_syscall1(void *cpu_env, int
num, abi_long arg1,
             if (p == NULL) {
                 return -TARGET_EFAULT;
             }
+            if (strcmp("/etc/ld.so.cache", path(p)) == 0) {
+                unlock_user(p, arg1, 0);
+                return -TARGET_ENONET;
+            }
 #if defined(__NR_statx)
             {
                 /*
-- 
2.7.4


On Mon, Aug 19, 2019 at 3:08 PM David Hildenbrand <david@redhat.com> wrote:

> On 19.08.19 14:11, Peter Maydell wrote:
> > On Sat, 17 Aug 2019 at 17:14, David Hildenbrand <david@redhat.com>
> wrote:
> >>
> >> On 17.08.19 17:59, David Hildenbrand wrote:
> >>> Hi everybody,
> >>>
> >>> I was just trying to run qemu-s390x (linux-user) with a very simple
> >>> binary (gzip + lib/ld64.so.1, compiled under Fedora 27). This used to
> >>> work just fine a while ago (especially when I was working on vector
> >>> instructions using QEMU v3.1). However, now I can't get past a SEGFAULT
> >>> in the dynamic library loader (I assume it is trying to locate glibc).
> I
> >>> tried a couple of other binaries that definitely used to work (from
> >>> Fedora 30).
> >>>
> >>> I checked QEMU v4.1, v4.0 and v3.1. All are broken for me. Which is
> >>> weird - because it used to work :/
> >>>
> >>> I remember that I was running Fedora 29 the last time I had it running,
> >>> so my gut feeling is that this is related to some other system library
> >>> (but which?). I am running on an up-to-date Fedora 30 x86-64 now.
> >>>
> >>> Any ideas? Has this been reported already? (not sure if this is a
> Fedora
> >>> 30 issue)
> >
> > I'm pretty sure the problem you've run into is a long standing
> > bug in the glibc dynamic loader. It cannot cope with the ld.so.cache
> > being for the wrong endianness. (Correct endianness but incorrect
> > architecture it correctly detects and ignores). The result is that
> > running a linux-user QEMU dynamic binary for big-endian on little-endian
> > like this will crash in the dynamic loader unless you arrange that it
> can't
> > find the host's ld.so.cache somehow, eg:
> >  (a) run inside a chroot
> >  (b) create an empty /etc/ld.so.cache file inside the -L directory
> >
> > The ideal fix would be if somebody cared enough to track down
> > and fix the ld.so bug.
> >
> > Compare:
> > https://bugs.launchpad.net/qemu/+bug/1701798
> > https://bugs.launchpad.net/qemu/+bug/1835693
> >
> > thanks
> > -- PMM
> >
>
> Thanks, running
>
> "ldconfig -c etc/ld.so.cache -r ."
>
> Seems to fix the issue for me. So you are sure the bug resides in glic
> and not in the qemu-user pieces of the library loader?
>
> --
>
> Thanks,
>
> David / dhildenb
>
>

--000000000000d25f4e05907866f1
Content-Type: text/x-patch; charset="US-ASCII"; 
	name="0001-linux-user-Special-case-etc-ld.cache.so-and-pretend-.patch"
Content-Disposition: attachment; 
	filename="0001-linux-user-Special-case-etc-ld.cache.so-and-pretend-.patch"
Content-Transfer-Encoding: base64
Content-ID: <f_jzifmpf40>
X-Attachment-Id: f_jzifmpf40

RnJvbSAzNzdmOTllODA3ZjRhYTQyZWNlOWYwY2Q0MzdmNTBhZjExNjExYjRjIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBBbGVrc2FuZGFyIE1hcmtvdmljIDxhbWFya292aWNAd2F2ZWNv
bXAuY29tPgpEYXRlOiBNb24sIDE5IEF1ZyAyMDE5IDE1OjIwOjI5ICswMjAwClN1YmplY3Q6IFtQ
QVRDSF0gbGludXgtdXNlcjogU3BlY2lhbCBjYXNlIC9ldGMvbGQuY2FjaGUuc28gYW5kIHByZXRl
bmQgaXQgZG9lcwogbm90IGV4aXN0CgpQcmV2ZW50IHRhcmdldCBleGVjdXRhYmxlcyBmcm9tIG9w
ZW5pbmcgaG9zdCBsZC5zby5jYWNoZS4KLS0tCiBsaW51eC11c2VyL3N5c2NhbGwuYyB8IDI4ICsr
KysrKysrKysrKysrKysrKysrKysrKysrKysKIDEgZmlsZSBjaGFuZ2VkLCAyOCBpbnNlcnRpb25z
KCspCgpkaWZmIC0tZ2l0IGEvbGludXgtdXNlci9zeXNjYWxsLmMgYi9saW51eC11c2VyL3N5c2Nh
bGwuYwppbmRleCA4MzY3Y2IxLi5mNWJhZTZlIDEwMDY0NAotLS0gYS9saW51eC11c2VyL3N5c2Nh
bGwuYworKysgYi9saW51eC11c2VyL3N5c2NhbGwuYwpAQCAtODgyMCw2ICs4ODIwLDEwIEBAIHN0
YXRpYyBhYmlfbG9uZyBkb19zeXNjYWxsMSh2b2lkICpjcHVfZW52LCBpbnQgbnVtLCBhYmlfbG9u
ZyBhcmcxLAogICAgICAgICBpZiAoIShwID0gbG9ja191c2VyX3N0cmluZyhhcmcxKSkpIHsKICAg
ICAgICAgICAgIHJldHVybiAtVEFSR0VUX0VGQVVMVDsKICAgICAgICAgfQorICAgICAgICBpZiAo
c3RyY21wKCIvZXRjL2xkLnNvLmNhY2hlIiwgcGF0aChwKSkgPT0gMCkgeworICAgICAgICAgICAg
dW5sb2NrX3VzZXIocCwgYXJnMSwgMCk7CisgICAgICAgICAgICByZXR1cm4gLVRBUkdFVF9FTk9O
RVQ7CisgICAgICAgIH0KICAgICAgICAgcmV0ID0gZ2V0X2Vycm5vKHN0YXRmcyhwYXRoKHApLCAm
c3RmcykpOwogICAgICAgICB1bmxvY2tfdXNlcihwLCBhcmcxLCAwKTsKICAgICBjb252ZXJ0X3N0
YXRmczoKQEAgLTg4NTksNiArODg2MywxMCBAQCBzdGF0aWMgYWJpX2xvbmcgZG9fc3lzY2FsbDEo
dm9pZCAqY3B1X2VudiwgaW50IG51bSwgYWJpX2xvbmcgYXJnMSwKICAgICAgICAgaWYgKCEocCA9
IGxvY2tfdXNlcl9zdHJpbmcoYXJnMSkpKSB7CiAgICAgICAgICAgICByZXR1cm4gLVRBUkdFVF9F
RkFVTFQ7CiAgICAgICAgIH0KKyAgICAgICAgaWYgKHN0cmNtcCgiL2V0Yy9sZC5zby5jYWNoZSIs
IHBhdGgocCkpID09IDApIHsKKyAgICAgICAgICAgIHVubG9ja191c2VyKHAsIGFyZzEsIDApOwor
ICAgICAgICAgICAgcmV0dXJuIC1UQVJHRVRfRU5PTkVUOworICAgICAgICB9CiAgICAgICAgIHJl
dCA9IGdldF9lcnJubyhzdGF0ZnMocGF0aChwKSwgJnN0ZnMpKTsKICAgICAgICAgdW5sb2NrX3Vz
ZXIocCwgYXJnMSwgMCk7CiAgICAgY29udmVydF9zdGF0ZnM2NDoKQEAgLTkwNTksNiArOTA2Nywx
MCBAQCBzdGF0aWMgYWJpX2xvbmcgZG9fc3lzY2FsbDEodm9pZCAqY3B1X2VudiwgaW50IG51bSwg
YWJpX2xvbmcgYXJnMSwKICAgICAgICAgaWYgKCEocCA9IGxvY2tfdXNlcl9zdHJpbmcoYXJnMSkp
KSB7CiAgICAgICAgICAgICByZXR1cm4gLVRBUkdFVF9FRkFVTFQ7CiAgICAgICAgIH0KKyAgICAg
ICAgaWYgKHN0cmNtcCgiL2V0Yy9sZC5zby5jYWNoZSIsIHBhdGgocCkpID09IDApIHsKKyAgICAg
ICAgICAgIHVubG9ja191c2VyKHAsIGFyZzEsIDApOworICAgICAgICAgICAgcmV0dXJuIC1UQVJH
RVRfRU5PTkVUOworICAgICAgICB9CiAgICAgICAgIHJldCA9IGdldF9lcnJubyhzdGF0KHBhdGgo
cCksICZzdCkpOwogICAgICAgICB1bmxvY2tfdXNlcihwLCBhcmcxLCAwKTsKICAgICAgICAgZ290
byBkb19zdGF0OwpAQCAtOTA2OCw2ICs5MDgwLDEwIEBAIHN0YXRpYyBhYmlfbG9uZyBkb19zeXNj
YWxsMSh2b2lkICpjcHVfZW52LCBpbnQgbnVtLCBhYmlfbG9uZyBhcmcxLAogICAgICAgICBpZiAo
IShwID0gbG9ja191c2VyX3N0cmluZyhhcmcxKSkpIHsKICAgICAgICAgICAgIHJldHVybiAtVEFS
R0VUX0VGQVVMVDsKICAgICAgICAgfQorICAgICAgICBpZiAoc3RyY21wKCIvZXRjL2xkLnNvLmNh
Y2hlIiwgcGF0aChwKSkgPT0gMCkgeworICAgICAgICAgICAgdW5sb2NrX3VzZXIocCwgYXJnMSwg
MCk7CisgICAgICAgICAgICByZXR1cm4gLVRBUkdFVF9FTk9ORVQ7CisgICAgICAgIH0KICAgICAg
ICAgcmV0ID0gZ2V0X2Vycm5vKGxzdGF0KHBhdGgocCksICZzdCkpOwogICAgICAgICB1bmxvY2tf
dXNlcihwLCBhcmcxLCAwKTsKICAgICAgICAgZ290byBkb19zdGF0OwpAQCAtMTAyNjgsNiArMTAy
ODQsMTAgQEAgc3RhdGljIGFiaV9sb25nIGRvX3N5c2NhbGwxKHZvaWQgKmNwdV9lbnYsIGludCBu
dW0sIGFiaV9sb25nIGFyZzEsCiAgICAgICAgIGlmICghKHAgPSBsb2NrX3VzZXJfc3RyaW5nKGFy
ZzEpKSkgewogICAgICAgICAgICAgcmV0dXJuIC1UQVJHRVRfRUZBVUxUOwogICAgICAgICB9Cisg
ICAgICAgIGlmIChzdHJjbXAoIi9ldGMvbGQuc28uY2FjaGUiLCBwYXRoKHApKSA9PSAwKSB7Cisg
ICAgICAgICAgICB1bmxvY2tfdXNlcihwLCBhcmcxLCAwKTsKKyAgICAgICAgICAgIHJldHVybiAt
VEFSR0VUX0VOT05FVDsKKyAgICAgICAgfQogICAgICAgICByZXQgPSBnZXRfZXJybm8oc3RhdChw
YXRoKHApLCAmc3QpKTsKICAgICAgICAgdW5sb2NrX3VzZXIocCwgYXJnMSwgMCk7CiAgICAgICAg
IGlmICghaXNfZXJyb3IocmV0KSkKQEAgLTEwMjc5LDYgKzEwMjk5LDEwIEBAIHN0YXRpYyBhYmlf
bG9uZyBkb19zeXNjYWxsMSh2b2lkICpjcHVfZW52LCBpbnQgbnVtLCBhYmlfbG9uZyBhcmcxLAog
ICAgICAgICBpZiAoIShwID0gbG9ja191c2VyX3N0cmluZyhhcmcxKSkpIHsKICAgICAgICAgICAg
IHJldHVybiAtVEFSR0VUX0VGQVVMVDsKICAgICAgICAgfQorICAgICAgICBpZiAoc3RyY21wKCIv
ZXRjL2xkLnNvLmNhY2hlIiwgcGF0aChwKSkgPT0gMCkgeworICAgICAgICAgICAgdW5sb2NrX3Vz
ZXIocCwgYXJnMSwgMCk7CisgICAgICAgICAgICByZXR1cm4gLVRBUkdFVF9FTk9ORVQ7CisgICAg
ICAgIH0KICAgICAgICAgcmV0ID0gZ2V0X2Vycm5vKGxzdGF0KHBhdGgocCksICZzdCkpOwogICAg
ICAgICB1bmxvY2tfdXNlcihwLCBhcmcxLCAwKTsKICAgICAgICAgaWYgKCFpc19lcnJvcihyZXQp
KQpAQCAtMTAzMTksNiArMTAzNDMsMTAgQEAgc3RhdGljIGFiaV9sb25nIGRvX3N5c2NhbGwxKHZv
aWQgKmNwdV9lbnYsIGludCBudW0sIGFiaV9sb25nIGFyZzEsCiAgICAgICAgICAgICBpZiAocCA9
PSBOVUxMKSB7CiAgICAgICAgICAgICAgICAgcmV0dXJuIC1UQVJHRVRfRUZBVUxUOwogICAgICAg
ICAgICAgfQorICAgICAgICAgICAgaWYgKHN0cmNtcCgiL2V0Yy9sZC5zby5jYWNoZSIsIHBhdGgo
cCkpID09IDApIHsKKyAgICAgICAgICAgICAgICB1bmxvY2tfdXNlcihwLCBhcmcxLCAwKTsKKyAg
ICAgICAgICAgICAgICByZXR1cm4gLVRBUkdFVF9FTk9ORVQ7CisgICAgICAgICAgICB9CiAjaWYg
ZGVmaW5lZChfX05SX3N0YXR4KQogICAgICAgICAgICAgewogICAgICAgICAgICAgICAgIC8qCi0t
IAoyLjcuNAoK
--000000000000d25f4e05907866f1--

