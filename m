Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 314B31BB818
	for <lists+qemu-devel@lfdr.de>; Tue, 28 Apr 2020 09:52:40 +0200 (CEST)
Received: from localhost ([::1]:45322 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jTL2l-0003P8-6q
	for lists+qemu-devel@lfdr.de; Tue, 28 Apr 2020 03:52:39 -0400
Received: from eggs.gnu.org ([209.51.188.92]:44828)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1jTKzv-0006KZ-AB
 for qemu-devel@nongnu.org; Tue, 28 Apr 2020 03:51:22 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.90_1)
 (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1jTKwK-0007Tq-7h
 for qemu-devel@nongnu.org; Tue, 28 Apr 2020 03:49:43 -0400
Received: from mail-wr1-x42d.google.com ([2a00:1450:4864:20::42d]:41474)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1jTKdJ-0000VV-Oc
 for qemu-devel@nongnu.org; Tue, 28 Apr 2020 03:26:21 -0400
Received: by mail-wr1-x42d.google.com with SMTP id g13so23355672wrb.8
 for <qemu-devel@nongnu.org>; Tue, 28 Apr 2020 00:26:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:subject:to:references:from:autocrypt:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=2zE8Gg68lKF991RYFUbZipQC4tJOEoIkn4Qz0Wt2qNA=;
 b=kufyVSWh02MZfiED0OHRXISt/3lur/31mKzhfUU7X/oTLyDq/UxTL4lX49rd0u2cpQ
 FVjnguKiYgoBwadADq0n9RvpuPptY5qHYMSx9eChHl9MvZZ7io6bBDqaT+JpnkuWT4r6
 FcI7DiZxX9iaVejKUVwpHrkSgUc5X8NfO1DKZho4s4mLnanG8AqAOUWolne9AETkmxFS
 eR1fTFiQmL9yZgvDWWY/xpp2OxzxnhAFzciMUJig4BO6J7RHKbhsuZa+pa1lGuNbLXls
 +QBgjvFFHf2JsQMPnD6hLLPxOeB49QnRy2EqCxqHUZhXHq67wIkqPyMNIGkFHrBcq6CV
 LeFA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:subject:to:references:from:autocrypt
 :message-id:date:user-agent:mime-version:in-reply-to
 :content-language:content-transfer-encoding;
 bh=2zE8Gg68lKF991RYFUbZipQC4tJOEoIkn4Qz0Wt2qNA=;
 b=EpR2FFoEfFTu/C236xPhovqU3lcxtfZL/5Bl40FOcBd1bKJLQc9DY8Hs/sf/Gxyd0t
 LdmBm0wsn+ob3GJUVqHYdrPULehP64NNfVBZY6ZCx/3gWsEmh6q/SX7fOXSwkRf0J8F7
 k9JpBDcYMHLyXut0rnYIZvhRT4oiEwykC1jbPzrVbNJH9zrj85HMRqZHjRFeNFSOk8r2
 gfFZysSYViJDlIdw9AtMC0DyN4/mXD0ZIKTmByxdpM8tOvstYkSLrN3YPGLpISICDAE0
 X6YqiGn3r4Ej1n84gZCLGmAGZEWPEq3PF2z2RKKbn5GMAB1jewt9vT21yrdDcfNqWRO2
 Cx7Q==
X-Gm-Message-State: AGi0PubmDogD5lVdDNoMKML/H35w5eEmezv4UrIFPzqr3uiv6EuY4Sab
 03Vb1ctqIqXvAnuzAbqMMDKhm37eHI0=
X-Google-Smtp-Source: APiQypLn5YFlOyzFZoiOfszLhaZkmeO/qR2hIM5M93rcYz187daocYO3JBA0hyn2YGImsDAeG9/QXQ==
X-Received: by 2002:adf:9793:: with SMTP id s19mr29528487wrb.147.1588058779522; 
 Tue, 28 Apr 2020 00:26:19 -0700 (PDT)
Received: from [192.168.1.39] (137.red-88-21-205.staticip.rima-tde.net.
 [88.21.205.137])
 by smtp.gmail.com with ESMTPSA id i74sm6518089wri.49.2020.04.28.00.26.18
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 28 Apr 2020 00:26:18 -0700 (PDT)
Subject: Re: [Bug 1874674] Re: [Feature request] acceptance test class to run
 user-mode binaries
To: Bug 1874674 <1874674@bugs.launchpad.net>, qemu-devel@nongnu.org
References: <158772186217.18152.387783445327371928.malonedeb@wampee.canonical.com>
 <158775567923.17926.10729887989020372018.malone@wampee.canonical.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Autocrypt: addr=f4bug@amsat.org; keydata=
 mQINBDU8rLoBEADb5b5dyglKgWF9uDbIjFXU4gDtcwiga9wJ/wX6xdhBqU8tlQ4BroH7AeRl
 u4zXP0QnBDAG7EetxlQzcfYbPmxFISWjckDBFvDbFsojrZmwF2/LkFSzlvKiN5KLghzzJhLO
 HhjGlF8deEZz/d/G8qzO9mIw8GIBS8uuWh6SIcG/qq7+y+2+aifaj92EdwU79apZepT/U3vN
 YrfcAuo1Ycy7/u0hJ7rlaFUn2Fu5KIgV2O++hHYtCCQfdPBg/+ujTL+U+sCDawCyq+9M5+LJ
 ojCzP9rViLZDd/gS6jX8T48hhidtbtsFRj/e9QpdZgDZfowRMVsRx+TB9yzjFdMO0YaYybXp
 dg/wCUepX5xmDBrle6cZ8VEe00+UQCAU1TY5Hs7QFfBbjgR3k9pgJzVXNUKcJ9DYQP0OBH9P
 ZbZvM0Ut2Bk6bLBO5iCVDOco0alrPkX7iJul2QWBy3Iy9j02GnA5jZ1Xtjr9kpCqQT+sRXso
 Vpm5TPGWaWljIeLWy/qL8drX1eyJzwTB3A36Ck4r3YmjMjfmvltSZB1uAdo1elHTlFEULpU/
 HiwvvqXQ9koB15U154VCuguvx/Qnboz8GFb9Uw8VyawzVxYVNME7xw7CQF8FYxzj6eI7rBf2
 Dj/II6wxWPgDEy3oUzuNOxTB7sT3b/Ym76yOJzWX5BylXQIJ5wARAQABtDFQaGlsaXBwZSBN
 YXRoaWV1LURhdWTDqSAoRjRCVUcpIDxmNGJ1Z0BhbXNhdC5vcmc+iQJVBBMBCAA/AhsPBgsJ
 CAcDAgYVCAIJCgsEFgIDAQIeAQIXgBYhBPqr514SkXIh3P1rsuPjLCzercDeBQJd660aBQks
 klzgAAoJEOPjLCzercDe2iMP+gMG2dUf+qHz2uG8nTBGMjgK0aEJrKVPodFA+iedQ5Kp3BMo
 jrTg3/DG1HMYdcvQu/NFLYwamUfUasyor1k+3dB23hY09O4xOsYJBWdilkBGsJTKErUmkUO2
 3J/kawosvYtJJSHUpw3N6mwz/iWnjkT8BPp7fFXSujV63aZWZINueTbK7Y8skFHI0zpype9s
 loU8xc4JBrieGccy3n4E/kogGrTG5jcMTNHZ106DsQkhFnjhWETp6g9xOKrzZQbETeRBOe4P
 sRsY9YSG2Sj+ZqmZePvO8LyzGRjYU7T6Z80S1xV0lH6KTMvq7vvz5rd92f3pL4YrXq+e//HZ
 JsiLen8LH/FRhTsWRgBtNYkOsd5F9NvfJtSM0qbX32cSXMAStDVnS4U+H2vCVCWnfNug2TdY
 7v4NtdpaCi4CBBa3ZtqYVOU05IoLnlx0miKTBMqmI05kpgX98pi2QUPJBYi/+yNu3fjjcuS9
 K5WmpNFTNi6yiBbNjJA5E2qUKbIT/RwQFQvhrxBUcRCuK4x/5uOZrysjFvhtR8YGm08h+8vS
 n0JCnJD5aBhiVdkohEFAz7e5YNrAg6kOA5IVRHB44lTBOatLqz7ntwdGD0rteKuHaUuXpTYy
 CRqCVAKqFJtxhvJvaX0vLS1Z2dwtDwhjfIdgPiKEGOgCNGH7R8l+aaM4OPOd
Message-ID: <8c80473f-d4fe-a699-fdf5-170aed4d879a@amsat.org>
Date: Tue, 28 Apr 2020 09:26:17 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.5.0
MIME-Version: 1.0
In-Reply-To: <158775567923.17926.10729887989020372018.malone@wampee.canonical.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42d;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x42d.google.com
X-detected-operating-system: by eggs.gnu.org: Error: [-] PROGRAM ABORT :
 Malformed IPv6 address (bad octet value).
 Location : parse_addr6(), p0f-client.c:67
X-Received-From: 2a00:1450:4864:20::42d
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

On 4/24/20 9:14 PM, Richard Henderson wrote:
> What user-mode testing do you think might be improved by using avocado?

Test unmodified real-world binaries, know to work in the field.

Test can be added by users without having to be a TCG developer, see
https://www.mail-archive.com/qemu-devel@nongnu.org/msg626608.html:

  class LoadBFLT(LinuxUserTest):
      def test_stm32(self):
          rootfs_url = ('https://elinux.org/images/5/51/'
                        'Stm32_mini_rootfs.cpio.bz2')
          rootfs_path_bz2 = self.fetch_asset(rootfs_url, ...)
          busybox_path = self.workdir + "/bin/busybox"

          res = self.run("%s %s" % (busybox_path, cmd))
          ver = 'BusyBox v1.24.0.git (2015-02-03 22:17:13 CET) ...'
          self.assertIn(ver, res.stdout_text)

          cmd = 'uname -a'
          res = self.run("%s %s" % (busybox_path, cmd))
          unm = 'armv7l GNU/Linux'
          self.assertIn(unm, res.stdout_text)

This is a fairly trivial test, cheap (no need to cross-build), yet it
still covers quite some QEMU code.

> IMO at present we have a fairly comprehensive testing infrastructure for
> user-mode that is simply underused.  With docker, we have a set of
> cross-compilers for most guest architectures, and we are able to build
> statically linked binaries that are copied out of the container for
> testing by the just-built qemu binaries on the host.  This
> infrastructure is used by check-tcg.  It's fairly easy to add new test
> cases to be run on one or all guests.

What you describe is a different and complementary test set. Craft tests
and build them with QEMU.

