Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B440A4CF85
	for <lists+qemu-devel@lfdr.de>; Thu, 20 Jun 2019 15:49:30 +0200 (CEST)
Received: from localhost ([::1]:47864 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.86_2)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1hdxRR-0005Lm-Pc
	for lists+qemu-devel@lfdr.de; Thu, 20 Jun 2019 09:49:29 -0400
Received: from eggs.gnu.org ([209.51.188.92]:56686)
 by lists.gnu.org with esmtp (Exim 4.86_2)
 (envelope-from <alex.bennee@linaro.org>) id 1hdxKY-000204-R1
 for qemu-devel@nongnu.org; Thu, 20 Jun 2019 09:42:24 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <alex.bennee@linaro.org>) id 1hdxGq-0006xw-Hx
 for qemu-devel@nongnu.org; Thu, 20 Jun 2019 09:39:13 -0400
Received: from mail-wm1-x341.google.com ([2a00:1450:4864:20::341]:40681)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <alex.bennee@linaro.org>)
 id 1hdxGq-0006xG-B7
 for qemu-devel@nongnu.org; Thu, 20 Jun 2019 09:38:32 -0400
Received: by mail-wm1-x341.google.com with SMTP id v19so3208421wmj.5
 for <qemu-devel@nongnu.org>; Thu, 20 Jun 2019 06:38:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=references:user-agent:from:to:cc:subject:in-reply-to:date
 :message-id:mime-version:content-transfer-encoding;
 bh=ChS5Bm8Cy2nx7D8AJ2SQOHL7Gz4XI23taNfIK8qu5as=;
 b=ozcOz1oSDbJzGr8v6xy+8hW4Kr9uXsrJtkIGbS6YcjkQb0S6WNqHca3Bk6Z/QoxDAu
 ye5r2j+H4NmIR04ch9Pr5am8TEvsm6o1nSHe9fvCaToWlOHaWWOcDOhQHvtc05mD9poZ
 xEBYrtNCq1FtDpwHIuZuAxmUPdtpfiJaHyfuQDg/umQVAFG0eXI7SAywVWkBLvdhLja6
 WSXm49vfUTwEFxy9St+Z72POnRUrX3RA6GmBS4BXUCBOqJzRlOnxC9ZJQz9uyGTtHSEk
 wh6o4C4EL47f7AVkH3H84MlT9KQ/0HSpR7wOmxK1gv0vGEw3KhzIcfPWbrQmAr7cehU+
 x0SA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:references:user-agent:from:to:cc:subject
 :in-reply-to:date:message-id:mime-version:content-transfer-encoding;
 bh=ChS5Bm8Cy2nx7D8AJ2SQOHL7Gz4XI23taNfIK8qu5as=;
 b=b/RVZPRHoVXYx4Rbp1ILSGOkPLV3Z4xGRReG7xAHEQQSy1yV2KwtZfjwqS6zil81hk
 Ie2RWFSKCMuHVa+TU4ZiGfbhYxubuNVBC2aQn3pS20m3QzNSU88T8MrkLf5W4TAg/ZF9
 MZ1VkyLVeBK7B+wEwXiv+APKLUyVTropGQoft33aDN0iQyZiyAD4mEl8lTywXvPOKMl9
 dzcr6X7mT/6RmpzmUi0jGCQ3ZjbSpFBbzXvzuKbIMj2uVr3gqrdkNwS0u8NVYSTisNOR
 ZaYI2S8oR4dfpkICLenF61wPDoSVts85jHA58Hx1LT9cNs4KKR0YZxd7pTPaADLNjVbg
 jXOQ==
X-Gm-Message-State: APjAAAWiG5IG86i95eUyFfS/A7f3Pd2oqHFoUKVPnI9SNPVbz/sjJm7U
 X7Ey71+PkpGD9e9Rv7ED0ZH0IQ==
X-Google-Smtp-Source: APXvYqwvN2Vo4nB/BByr66TW4nHITkMhw36CI5y7Pz3aRdnyMBydtGjiXTzAnO6+YXSl/ZIv01D0sg==
X-Received: by 2002:a05:600c:20d:: with SMTP id
 13mr2917644wmi.141.1561037910003; 
 Thu, 20 Jun 2019 06:38:30 -0700 (PDT)
Received: from zen.linaroharston ([81.128.185.34])
 by smtp.gmail.com with ESMTPSA id q193sm3894624wme.8.2019.06.20.06.38.28
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Thu, 20 Jun 2019 06:38:29 -0700 (PDT)
Received: from zen (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 9AAAD1FF87;
 Thu, 20 Jun 2019 14:38:28 +0100 (BST)
References: <20190614171200.21078-1-alex.bennee@linaro.org>
 <20190614171200.21078-6-alex.bennee@linaro.org>
 <CADYwmhHjfqDi_vXWnp_z9UUr2Lxvw6F8op3KJQqvU3Wog43f_Q@mail.gmail.com>
User-agent: mu4e 1.3.2; emacs 26.1
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Pranith Kumar <bobby.prani@gmail.com>
In-reply-to: <CADYwmhHjfqDi_vXWnp_z9UUr2Lxvw6F8op3KJQqvU3Wog43f_Q@mail.gmail.com>
Date: Thu, 20 Jun 2019 14:38:28 +0100
Message-ID: <87tvck8jhn.fsf@zen.linaroharston>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2a00:1450:4864:20::341
Subject: Re: [Qemu-devel] [PATCH v3 05/50] docs/devel: add plugins.rst
 design document
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
Cc: qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


Pranith Kumar <bobby.prani@gmail.com> writes:

<snip>
>> +
>> +Plugin Life cycle
>> +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
>> +
>> +First the plugin is loaded and the public qemu_plugin_install function
>> +is called. The plugin with then register callbacks for various plugin
>
> s/with/will/
>
>> +events. Generally at least the atexit_cb is registered so the plugin
>> +can dump its information at the end of a run.
>
> Is that a hard requirement?

Not really although for a lot of plugins it is a natural point to dump
the results of the experiment.

<snip>
>> +
>> +As a result registering/unregistering callbacks is "slow", since it
>> +takes a lock. But this is very infrequent; we want performance when
>> +calling (or not calling) callbacks, not when registering them. Using
>> +RCU is great for this.
>> +
>> +We support the uninstallation of a plugin at any time (e.g. from plugin
>> +callbacks). This means some callbacks might still be called after the u=
ninstall
>> +function returns. The plugin isn't completely uninstalled until the
>> +safe work has executed while all vCPUs are quiescent.
>
> Isn't this when the atexit callback is invoked? Might add that to make
> it clearer.

No we can uninstall at any time, I've amended to:

  We support the uninstallation of a plugin at any time (e.g. from
  plugin callbacks). This allows plugins to remove themselves if they no
  longer want to instrument the code. This operation is asynchronous
  which means callbacks may still occur after the uninstall operation is
  requested. The plugin isn't completely uninstalled until the safe work
  has executed while all vCPUs are quiescent.

--
Alex Benn=C3=A9e

