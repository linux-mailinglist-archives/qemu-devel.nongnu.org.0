Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E5747331B2E
	for <lists+qemu-devel@lfdr.de>; Tue,  9 Mar 2021 00:55:17 +0100 (CET)
Received: from localhost ([::1]:45898 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lJPiW-0004WM-I6
	for lists+qemu-devel@lfdr.de; Mon, 08 Mar 2021 18:55:16 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:45490)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ben.leslie@gmail.com>)
 id 1lJPhm-00045r-Su
 for qemu-devel@nongnu.org; Mon, 08 Mar 2021 18:54:30 -0500
Received: from mail-vs1-f44.google.com ([209.85.217.44]:33064)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <ben.leslie@gmail.com>)
 id 1lJPhl-00089s-04
 for qemu-devel@nongnu.org; Mon, 08 Mar 2021 18:54:30 -0500
Received: by mail-vs1-f44.google.com with SMTP id b189so5862857vsd.0
 for <qemu-devel@nongnu.org>; Mon, 08 Mar 2021 15:54:27 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
 bh=G6S2LEiGLXU8ZWvl8YTZPVAvJj3NTusq0IDkpgaaOiQ=;
 b=VtoZ2yYK+OgughI5IkAo4Whk5mu4SayYWh84c7YOt9FT0WqWJrYQpItCSuhtF7NZ84
 LhagwV482BGkP+DOx+jxqrEs/szeBdq1gDzgRWGtPnWmxsACtN3AGysvkC8ok23H+azK
 YhY9oy1/TXXkGJsHLiRNn/YwLEPw+nQixuw/UodsDs2d+HaANuvzRWHFLZhEGC7Q7Gtg
 0m93UrNNSMYpRI6Zk5Ng5Ue9xDiK1k5yhbO9+hoxCRiC1MVrBoMIBh2GYY9brDPH015W
 /gP+jtWztjOsjQWiOeVxSzYtGww+ZlemMjto3aMlb7fZ+4nBv1B+Ni5h8tcgLq9OI4HS
 NEvg==
X-Gm-Message-State: AOAM531K/sgHHd6BixCUfoE5rTWcuIfTPd6n/kSB+xkHjDCEp/eoKzDe
 hlz1IWLztUrPRTmuVAAsY6kw6RimBTZU7jOuHnISGhIa9MVMPw==
X-Google-Smtp-Source: ABdhPJy9C4EyqVL8BwvMItpO1D5tEquwlygm4Unoxh5zC5WQZuoS0mlslnSbhIhPfIeWy1ZGeJ7W1dapKK5GgRgL1o8=
X-Received: by 2002:a05:6102:21a4:: with SMTP id
 i4mr5857287vsb.13.1615247666745; 
 Mon, 08 Mar 2021 15:54:26 -0800 (PST)
MIME-Version: 1.0
From: Ben Leslie <benno@benno.id.au>
Date: Tue, 9 Mar 2021 10:54:15 +1100
Message-ID: <CABZ0LtCh37eXx0evxYNsZigFJgq-RY+wdFvA0SMDH4HgxpK-zw@mail.gmail.com>
Subject: What is the intended behaviour of usb_host_get_port for root hubs?
To: qemu-devel@nongnu.org
Content-Type: multipart/alternative; boundary="0000000000006694f405bd0f271d"
Received-SPF: pass client-ip=209.85.217.44; envelope-from=ben.leslie@gmail.com;
 helo=mail-vs1-f44.google.com
X-Spam_score_int: -13
X-Spam_score: -1.4
X-Spam_bar: -
X-Spam_report: (-1.4 / 5.0 requ) BAYES_00=-1.9, FREEMAIL_FORGED_FROMDOMAIN=0.25,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249, HTML_MESSAGE=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--0000000000006694f405bd0f271d
Content-Type: text/plain; charset="UTF-8"

When usb_host_get_port is called for a root-hub device what string should
be output in the port parameter?

The current behaviour writes a string with whatever stack value happened to
be in the paths stack array.

Possible behaviours that I can see being useful are:

1: Don't modify the port parameter.
2: Write an empty string.

My preference would be for #2, but possibly #1 is intended. I can provide a
patch if someone can let me know the intended behaviour. If #1 is intended,
then I think the usage in hmp_info_usbhost might need changing as well. The
other usage in usb_host_auto_check where the provided port parameter is set
to "-" prior to calling the function; it's not clear what the intent of
that is. Finally, the function returns zero on error and string length on
success (which actually makes #2 a problem), however none of the callers
check the return value, so perhaps it can be made a void function? Or
possibly it should return -1 on error, rather than zero.

Regards,

Ben

--0000000000006694f405bd0f271d
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div>When usb_host_get_port is called for a root-hub devic=
e what string should be output in the port parameter?</div><div><br></div><=
div><div>The current behaviour writes a string with whatever stack value ha=
ppened to be in the paths stack array.</div><div><br></div></div><div>Possi=
ble behaviours that I can see being useful are:</div><div><br></div><div>1:=
 Don&#39;t modify the port parameter.</div><div>2: Write an empty string.</=
div><div><br></div><div>My preference would be for #2, but possibly #1 is i=
ntended. I can provide a patch if someone can let me know the intended beha=
viour. If #1 is intended, then I think the usage in hmp_info_usbhost might =
need changing as well. The other usage in usb_host_auto_check where the pro=
vided port parameter is set to &quot;-&quot; prior to calling the function;=
 it&#39;s not clear what the intent of that is. Finally, the function retur=
ns zero on error and string length on success (which actually makes #2 a pr=
oblem), however none of the callers check the return value, so perhaps it c=
an be made a void function? Or possibly it should return -1 on error, rathe=
r than zero.<br></div><div><br></div><div>Regards,</div><div><br></div><div=
>Ben<br></div></div>

--0000000000006694f405bd0f271d--

