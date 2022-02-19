Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3B0C74BCAA7
	for <lists+qemu-devel@lfdr.de>; Sat, 19 Feb 2022 22:00:37 +0100 (CET)
Received: from localhost ([::1]:56812 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nLWqJ-0004Nx-UH
	for lists+qemu-devel@lfdr.de; Sat, 19 Feb 2022 16:00:35 -0500
Received: from eggs.gnu.org ([209.51.188.92]:52986)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <venture@google.com>)
 id 1nLWpN-0003iC-Nu
 for qemu-devel@nongnu.org; Sat, 19 Feb 2022 15:59:37 -0500
Received: from [2607:f8b0:4864:20::f31] (port=42984
 helo=mail-qv1-xf31.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <venture@google.com>)
 id 1nLWpM-0008Ro-3w
 for qemu-devel@nongnu.org; Sat, 19 Feb 2022 15:59:37 -0500
Received: by mail-qv1-xf31.google.com with SMTP id e22so21987050qvf.9
 for <qemu-devel@nongnu.org>; Sat, 19 Feb 2022 12:59:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20210112;
 h=mime-version:from:date:message-id:subject:to:cc;
 bh=v2OsXBbUV/OTLtt1yXoIWU3sGDxdHGfFBjY+aQLOClo=;
 b=rON8QpMCY+2qgzhjfvp0beWU++ml2eq62qcTH+JGLWPly7SRSSlNH+SsDQixhIT7i+
 b/j9JHFlaejtVVv/qYwYQHKxkuZoGjH/IMHyXBvyA+SCfn3k/B78PVhNF9RtbHp9BB3z
 pOmzLtFefHcgsl6OI+i9U7CYlyxc1iivTn8+qx03dDFOJ1ypzWZqVlHucplyBi+QDeKY
 3ls830lVXIURWT0KE8RlQ6I/wUjBCDTaj3D7rT8Fu8hLmmPzPpHsXExBSxfEDJFEhVs4
 Kn/Z3V166ZcGVFJEyGBwAOHDAvpOLFStbEPHsg5ID2SLpTZ2g4gmaoCuD8n0VizLxX3+
 /3uQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:from:date:message-id:subject:to:cc;
 bh=v2OsXBbUV/OTLtt1yXoIWU3sGDxdHGfFBjY+aQLOClo=;
 b=CS3Vg5zaRw8QDEUGdNUX0Wnz2MZttOI5mzRziFdqDNBOwLpX84dacnwmLIUhvJq69/
 NJuWWqNS3ryzlpQ/wtsuuGMwLKX2wn2ngWwVdFnXhVvNbK9whC3lp7DPjpKmPOr7xL+/
 rtfbzSYssgBye/zWYnMF/Co99ZdUXrAjBRCHksmPFlDZ4qCNNvjPyf2eEaxxFRIPfHer
 GFfI/tOMBNz9L6NDmnOzpVLXICUlBSWUI1lZRzLEX/hgk+wKXqbutoKRp3zAHWTjKh/q
 UJlg9ja+K3NkSZTgCWvFs8x8hO8+UCN1bUvgT4Oy2V29qKDfcJu5+UoskYQJgtPnJ3Ft
 PVQA==
X-Gm-Message-State: AOAM5322gNKRK6HeGmb7xhkv7j1OYPGpO9wgCw6TbK8vcK1gQU9j5N1u
 Z+abgoodbdlYjEVTZ7grnGwn4fEysrWW3T6VVTjyVRyq6VM=
X-Google-Smtp-Source: ABdhPJz+7qrZA4TBJlNJA1vVqCV1nevgMbWcFV1aK7tgMB1fycZHOCP4XQJFWoYtGi0JPpNw3nCj2AtSFKk4JSdBghw=
X-Received: by 2002:a67:c09a:0:b0:31a:9cc9:73b5 with SMTP id
 x26-20020a67c09a000000b0031a9cc973b5mr5282752vsi.36.1645304011152; Sat, 19
 Feb 2022 12:53:31 -0800 (PST)
MIME-Version: 1.0
From: Patrick Venture <venture@google.com>
Date: Sat, 19 Feb 2022 12:53:20 -0800
Message-ID: <CAO=notzg5M6h2GrF5RaV6uJytxjcf_MawbK8eJGKEYaZmi_s3g@mail.gmail.com>
Subject: at24c* device
To: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@redhat.com>
Cc: QEMU Developers <qemu-devel@nongnu.org>,
 Corey Minyard <cminyard@mvista.com>, 
 Hao Wu <wuhaotsh@google.com>, Willy Tu <wltu@google.com>
Content-Type: multipart/alternative; boundary="0000000000002261d805d8653171"
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::f31
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::f31;
 envelope-from=venture@google.com; helo=mail-qv1-xf31.google.com
X-Spam_score_int: -142
X-Spam_score: -14.3
X-Spam_bar: --------------
X-Spam_report: (-14.3 / 5.0 requ) BAYES_20=-0.001, DKIMWL_WL_MED=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 ENV_AND_HDR_SPF_MATCH=-0.5, HTML_MESSAGE=0.001, PDS_HP_HELO_NORDNS=0.659,
 RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01, USER_IN_DEF_DKIM_WL=-7.5,
 USER_IN_DEF_SPF_WL=-7.5 autolearn=no autolearn_force=no
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

--0000000000002261d805d8653171
Content-Type: text/plain; charset="UTF-8"

Philippe;

Looking at the at24c device, it doesn't support the c02 and other 1-byte
addressable eeproms that are supported by the at24c driver in linux, and
other compatible eeproms.  If I recall correctly, the smbus-eeprom device
correctly handles the 1-byte addressable variants, and so maybe it's not
required.  Before I add block device support to the smbus-eeprom device, I
wanted to ask if you or anyone thought it made more sense to fix the at24c
to have a address-length field that let it then operate for both versions.

The other tweak is that a block is 512 bytes, and the smaller eeprom is
256, so, there will be some other minor logic changes to allow it to
basically have a file backing larger than its addressable contents.

Thanks,
Patrick

--0000000000002261d805d8653171
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Philippe;<div><br></div><div>Looking at the at24c device, =
it doesn&#39;t support the c02 and other 1-byte addressable eeproms that ar=
e supported by the at24c driver in linux, and other compatible eeproms.=C2=
=A0 If I recall correctly, the smbus-eeprom device correctly handles the 1-=
byte addressable variants, and so maybe it&#39;s not required.=C2=A0 Before=
 I add block device support to the smbus-eeprom device, I wanted=C2=A0to as=
k if you or anyone thought it made more sense to fix the at24c to have a ad=
dress-length field that let it then operate for both versions.</div><div><b=
r></div><div>The other tweak is that a block is 512 bytes, and the smaller =
eeprom is 256, so, there will be some other minor logic changes to allow it=
 to basically have a file backing larger than its addressable contents.</di=
v><div><br></div><div>Thanks,</div><div>Patrick</div></div>

--0000000000002261d805d8653171--

