Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 18A9351ED78
	for <lists+qemu-devel@lfdr.de>; Sun,  8 May 2022 14:20:24 +0200 (CEST)
Received: from localhost ([::1]:45674 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nnfte-0005E7-IA
	for lists+qemu-devel@lfdr.de; Sun, 08 May 2022 08:20:22 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41028)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nnfsR-0004XI-Uf
 for qemu-devel@nongnu.org; Sun, 08 May 2022 08:19:07 -0400
Received: from mail-yb1-xb36.google.com ([2607:f8b0:4864:20::b36]:39786)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nnfsP-0008Tp-FH
 for qemu-devel@nongnu.org; Sun, 08 May 2022 08:19:07 -0400
Received: by mail-yb1-xb36.google.com with SMTP id r11so20378547ybg.6
 for <qemu-devel@nongnu.org>; Sun, 08 May 2022 05:19:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=PF2zPdIE04iOU9mS+u1CgTeqd3rfjHf8q9j4h/7K/7c=;
 b=c6twI6KZth69eFpSJM9t/740vpvSAIdAimhy/Wr9yYO6IHJi1BkY5qMoZoOJkmgu8g
 P09wgunUduOO5HqB2ED9nUQFwlMxkKyflF0+o7hS2fNECv4LP1gsHIOITBadd57fQ5xB
 83Sl3hSztJll2BkNDXDH4QP8af3gLnOihOqqAanhPTJ6QhVlsLxFSeMPuwNB9xCaNLaQ
 k5UdEkDMfzpH8dRAmVVt5ZQp6ebAGU+fx7AhrZWAtvViB+HxOsEEagVqRkelRUg1jBHX
 +7B28j3sB0M4NDAkteQL8IxQ2593rC/EjTnPBChaqSAJtkEQg/xlQyAZzHdmnk+8qrCv
 hTVg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=PF2zPdIE04iOU9mS+u1CgTeqd3rfjHf8q9j4h/7K/7c=;
 b=okYvtW7vx/VueWIYCUWTEoIAfQPOsBhqgHlaZ6OW9cEfKzhYByGdfY5iDmQHEGgUn2
 3r1erUvIu8PDG/ABLAxhx1hin3Lpq7NwlAQBKTy4SArTUdLW/jWooMzujsu8XE4Rn+d4
 zf8SwW18UwQTYC/Q8Y4wPAl10MZmzUwKUmur99tQiFzgoVdJnATLxdag/hoCplEG4GHT
 C+3eX3r0KnqENk63Pye1OiLDJ3mem800uP44T4SuNCegGVsWWjY6h0XfIBHdJTJhEjRv
 FRGzq6K846zb2CsdXux0NTJOjk3/jUgAMbNUIlfgiC6kBAACP7Ibt2xHbRtl7RA0gdSS
 HSbw==
X-Gm-Message-State: AOAM532vHz+OjUlFqLwL0zrG/iNYFk0yzW8k9OG2KkytXEchbJ0cjBCN
 rDJO30T2VCM3NHCKfEhJLFQlp3FN75pr4EWvQQprww==
X-Google-Smtp-Source: ABdhPJyGIIJCWBQxE5YQ8VjX5JKm6mf4sL5TLe7nKD71BRpfGXbvhTiw1/fpVfM2gca/8bGhSw38nkX1aU49o2g7uAo=
X-Received: by 2002:a5b:6c1:0:b0:633:b5c7:b9b7 with SMTP id
 r1-20020a5b06c1000000b00633b5c7b9b7mr9471039ybq.67.1652012344359; Sun, 08 May
 2022 05:19:04 -0700 (PDT)
MIME-Version: 1.0
References: <F1037D57-EB8E-43FA-A2C7-A43C45FEA82C@web.de>
 <7988B475-EEC0-4574-B0E2-BB61738B8964@web.de>
In-Reply-To: <7988B475-EEC0-4574-B0E2-BB61738B8964@web.de>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Sun, 8 May 2022 13:18:52 +0100
Message-ID: <CAFEAcA-Dy=nY9SCtxv0omYCQqDqGq6Qwvja4c6f_9rPR8L-KCA@mail.gmail.com>
Subject: Re: Possible bug in Aarch64 single-stepping
To: Chris Howard <cvz185@web.de>
Cc: qemu-devel@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2607:f8b0:4864:20::b36;
 envelope-from=peter.maydell@linaro.org; helo=mail-yb1-xb36.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_FILL_THIS_FORM_SHORT=0.01,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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

Introduction

This document will explain how setup Mutt email client using OAuth2
(modern authentication) to access your emails.

Authentication will be done using "bearer tokens" instead of a
combination of a username and an application password.

You can find more details about bearer tokens and the python script we
will use to generate them following this link.


Prerequisites

1) A working GPG setup on your machine. If you don't have this setup
please follow below steps:

Install gpg.

sudo apt install gpg or yum install gnupg2

Run gpg --gen-key

Answer the questions (your name, email address...)

Check you GPG setup

Create a text file with foo in it

echo foo > foo.txt

Encrypt your text file with your gpg key

gpg --batch --yes -e -r franck.iaropoli@arm.com foo.txt

Decrypt your foo.txt.gpg file

$ gpg -d foo.txt.gpg
gpg: encrypted with 3072-bit RSA key, ID 5F5E76BC0AD59EFD, created 2022-04-=
29
      "Franck Iaropoli <franck.iaropoli@arm.com>"
foo

Enter your passphrase (you may not asked if you entered it recently)
and you should see foo as result.

2) Download mutt_oauth2.py python script and make it executable.

For example

To download the script in your home directory and make it executable:

wget -O ~/mutt_oauth2.py
https://gitlab.com/muttmua/mutt/-/raw/master/contrib/mutt_oauth2.py
cd
chmod +x mutt_oauth2.py

Note: The mutt_oauth2.py script requires at least Python 3.7

3) At least Mutt 2.0.0. Earlier versions do not have the
imap_oauth_refresh_command function (see release notes with more
information in XOAUTH2 part).

4) The Mutt Azure application client_id which is
e86f5911-84ec-4635-b69a-313d29aa3858

5) For the gpg-agent to be able to ask you to unlock passphrase, set
the environment variable GPG_TTY to the current tty.

If you are using bash shell, put the following inside your .bashrc or
equivalent (.zshrc with zsh for example)

export GPG_TTY=3D$(tty)

Note: If you are not using an interactive session, you must export
GPG_TTY variable in your .bashrc_profile or equivalent (.zshenv with
zsh for example)

6) Edit the mutt_oauth2.py script :

Put your GPG identity in 'YOUR_GPG_IDENTITY' (your email address or
whatever you have set instead during gpg setup) in the ENCRYPTION_PIPE
line.

ENCRYPTION_PIPE =3D ['gpg', '--encrypt', '--recipient', 'YOUR_GPG_IDENTITY'=
]

For example:

ENCRYPTION_PIPE =3D ['gpg', '--encrypt', '--recipient', 'franck.iaropoli@ar=
m.com']

In the registrations, the microsoft one, enter the client_id
e86f5911-84ec-4635-b69a-313d29aa3858

registrations =3D {
    'google': {
...
    },
    'microsoft': {
...
        'client_id': 'e86f5911-84ec-4635-b69a-313d29aa3858',
        'client_secret': '',
    },
}

Create your tokens

Run the mutt_oauth2.py script with the path to the file that will
contain your tokens, the verbose and authorize options:

./mutt_oauth2.py <path to file with tokens> --verbose --authorize

For example:

./mutt_oauth2.py franck.iaropoli@arm.com.tokens --verbose --authorize

Note:

You should be asked to enter your gpg passphrase:

Select microsoft as app and endpoint registration:

$ ./mutt_oauth2.py franck.iaropoli@arm.com.tokens --verbose --authorize
Available app and endpoint registrations: google microsoft
OAuth2 registration: microsoft

Select your preferred OAuth2 flow:

- "authcode": you paste a complicated URL into a browser, then
manually extract a "code" parameter from a subsequent URL in the
browser address bar and paste that back to the script.

- "localhostauthcode": you again paste the complicated URL into a
browser but that's it --- the code is automatically extracted from the
response relying on a localhost redirect and temporarily listening on
a localhost port.
This flow can only be used if the web browser opening the redirect URL
sits on the same machine as where mutt is running, in other words can
not be used if you ssh to a remote machine and run mutt on that remote
machine while your web browser remains on your local machine.

- "devicecode": you go to a simple URL and just enter a short code.

We will use devicecode as it can work with a local or a remote session:

$ ./mutt_oauth2.py franck.iaropoli@arm.com.tokens --verbose --authorize
Available app and endpoint registrations: google microsoft
OAuth2 registration: microsoft
Preferred OAuth2 flow ("authcode" or "localhostauthcode" or
"devicecode"): devicecode

Enter your email address:

$ ./mutt_oauth2.py franck.iaropoli@arm.com.tokens --verbose --authorize
Available app and endpoint registrations: google microsoft
OAuth2 registration: microsoft
Preferred OAuth2 flow ("authcode" or "localhostauthcode" or
"devicecode"): devicecode
Account e-mail address: franck.iaropoli@arm.com

Now open the link given in the terminal in your preferred web browser:

$ ./mutt_oauth2.py franck.iaropoli@arm.com.tokens --verbose --authorize
Available app and endpoint registrations: google microsoft
OAuth2 registration: microsoft
Preferred OAuth2 flow ("authcode" or "localhostauthcode" or
"devicecode"): devicecode
Account e-mail address: franck.iaropoli@arm.com
To sign in, use a web browser to open the page
https://microsoft.com/devicelogin and enter the code D59TF5YCJ to
authenticate.
Polling...

Enter the code available in the terminal and click Next

Note: If you have recently done the authentication process you may
just have to select you account and not doing a full authentication:

Otherwise you will have to do the full authentication process as
explained below.

Enter your email address:

Enter your password:

Approve the sign in request with your preferred 2FA solution (here the
Microsoft Authenticator application was used)

Click Continue

You have now signed into Mutt application.

You can close the window.

Come back to the terminal. You will see that an access token has been obtai=
ned.

$ ./mutt_oauth2.py franck.iaropoli@arm.com.tokens --verbose --authorize
Available app and endpoint registrations: google microsoft
OAuth2 registration: microsoft
Preferred OAuth2 flow ("authcode" or "localhostauthcode" or
"devicecode"): devicecode
Account e-mail address: franck.iaropoli@arm.com
To sign in, use a web browser to open the page
https://microsoft.com/devicelogin and enter the code D59TF5YCJ to
authenticate.
Polling.............................................
NOTICE: Obtained new access token, expires 2022-04-28T14:07:59.922548.
Access Token: eyJ0eXAiOiJKV1QiLCJub25jZSI6Ii1lNzlNSXFWc1ZrUllzS3FjZ1lQa3Vze=
npaX25ZLWN6MGVxOXFERWlLVkEiLCJhbGciOiJSUzI1NiIsIng1dCI6ImpTMVhvMU9XRGpfNTJ2=
YndHTmd2UU8yVnpNYyIsImtpZCI6ImpTMVhvMU9XRGpfNTJ2YndHTmd2UU8yVnpNYyJ9.eyJhdW=
QiOiJodHRwczovL291dGxvb2sub2ZmaWNlLmNvbSIsImlzcyI6Imh0dHBzOi8vc3RzLndpbmRvd=
3MubmV0L2YzNGU1OTc5LTU3ZDktNGFhYS1hZDRkLWIxMjJhNjYyMTg0ZC8iLCJpYXQiOjE2NTEx=
NDM2NDMsIm5iZiI6MTY1MTE0MzY0MywiZXhwIjoxNjUxMTQ3Njc4LCJhY2N0IjowLCJhY3IiOiI=
xIiwiYWlvIjoiQVZRQXEvOFRBQUFBdEMybW55VitBaWViQkhxOG1lTDlWRlBOYWFTUnI0V2pCV1=
g2VWZpenJINkp6SVM1c1Fob0ludHB6QkJTWlIzelNMYStCNkJyZmxRemFvZUxsVFpvZk1pVzNpV=
WJMZXdqdXNQbWN4TTljbjQ9IiwiYW1yIjpbInB3ZCIsIm1mYSJdLCJhcHBfZGlzcGxheW5hbWUi=
OiJNdXR0IiwiYXBwaWQiOiJlODZmNTkxMS04NGVjLTQ2MzUtYjY5YS0zMTNkMjlhYTM4NTgiLCJ=
hcHBpZGFjciI6IjAiLCJlbmZwb2xpZHMiOltdLCJmYW1pbHlfbmFtZSI6Iklhcm9wb2xpIiwiZ2=
l2ZW5fbmFtZSI6IkZyYW5jayIsImlwYWRkciI6IjIxNy4xNDAuMTA2LjM5IiwibmFtZSI6IkZyY=
W5jayBJYXJvcG9saSIsIm9pZCI6ImY2NTc5MTIwLTBkODAtNGRkYS04ZmIzLTE0OWU4YTkyNTQy=
NyIsIm9ucHJlbV9zaWQiOiJTLTEtNS0yMS0xNzE1NTY3ODIxLTE2NDQ0OTE5MzctNzI1MzQ1NTQ=
zLTkxOTQ1IiwicHVpZCI6IjEwMDM3RkZFOTE2MUZGNzUiLCJyaCI6IjAuQVJBQWVWbE84OWxYcW=
txdFRiRWlwbUlZVFFJQUFBQUFBUEVQemdBQUFBQUFBQUFRQU1JLiIsInNjcCI6IklNQVAuQNGQt=
OWVhMS04NjU1MmY1NTUzODIiLCJzaWduaW5fc3RhdGUiOlsiaW5rbm93bm50d2siLCJrbXNpIl0=
sInN1YiI6InFjZFRSNG5xNjFCbmRlNWE0a0t3UzNrZzJlcm1IY2g0UnptdGF1NkpKQjAiLCJ0aW=
QiOiJmMzRlNTk3OS01N2Q5LTRhYWEtYWQ0ZC1iMTIyYTY2MjE4NGQiLCJ1bmlxdWVfbmFtZSI6I=
kZyYW5jay5JYXJvcG9saUBhcm0uY29tIiwidXBuIjoiRnJhbmNrLklhcm9wb2xpQGFybS5jb20i=
LCJ1dGkiOiJNVm5WeHNVdmMwaUM3bnNYdEtwekFBIiwidmVyIjoiMS4wIiwid2lkcyI6WyI3Mjk=
4MjdlMy05YzE0LTQ5ZjctYmIxYi05NjA4ZjE1NmJiYjgiLCJmZTkzMGJlNy01ZTYyLTQ3ZGItOT=
FhZi05OGMzYTQ5YTM4YjEiLCJiNzlmYmY0ZC0zZWY5LTQ2ODktODE0My03NmIxOTRlODU1MDkiX=
X0.Iwehvs9MSqTwsRTM4z6a_9reDde0Bh_cOhT1Brny1KtDyWhTOlStlx1CgGpckI7zdGEXxwYD=
mo4BON6PszehcjThQM9lp-dYhSzjp1Dn_P6C1N3iBw59IhhTKxfW9ZIsPx60Pcs0FJXmMQoJLnI=
bn3jqEzkzbkupu4nsuDTfSw886TsHQ1lS17dvO1qJDctLMMZzrQ0ZklmxQoIUypcqTb9a0plwIX=
iSMarm2uzybyEA3vgZOCFRzUohCVflyJBUa9Vm_z444gOEbFAPaMuPdo_-JNkFDzszxVrSI1c2z=
DJlN8ofq2VAScp5P_UELX72KyOkhl52jpcPmlrCpdmC-Q


Test your tokens

Run mutt_oauth2.py script with the path to your tokens file, the
verbose and the test option:

./mutt_oauth2.py <path to file with tokens> --verbose --test

For example:

$ ./mutt_oauth2.py franck.iaropoli@arm.com.tokens --verbose --test
Access Token: eyJ0eXAiOiJKV1QiLCJub25jZSI6Ii1CUGYtdWR1ZU9pZXBVSmZpaExBakpKS=
l9UdXVkcllPRjlYOGZWUTlLaGciLCJhbGciOiJSUzI1NiIsIng1dCI6ImpTMVhvMU9XRGpfNTJ2=
YndHTmd2UU8yVnpNYyIsImtpZCI6ImpTMVhvMU9XRGpfNTJ2YndHTmd2UU8yVnpNYyJ9.eyJhdW=
QiOiJodHRwczovL291dGxvb2sub2ZmaWNlLmNvbSIsImlzcyI6Imh0dHBzOi8vc3RzLndpbmRvd=
3MubmV0L2YzNGU1OTc5LTU3ZDktNGFhYS1hZDRkLWIxMjJhNjYyMTg0ZC8iLCJpYXQiOjE2NTEx=
NTQ3MDYsIm5iZiI6MTY1MTE1NDcwNiwiZXhwIjoxNjUxMTU5ODM0LCJhY2N0IjowLCJhY3IiOiI=
xIiwiYWlvIjoiQVZRQXEvOFRBQUFBVndRbnZJMmlRenJ0NEdPTGxHUWYzeDMvc3FQekxLZ3c5N2=
44SFN0L3RHcFl1Z21jRHdiMFJZeWcyb2J6cHVYTkU1NUZSS1l6aCtIM2NNbGxneUpNbEIyelVSa=
WtSaHlvbXBlZFlMMVVMV289IiwiYW1yIjpbInB3ZCIsIm1mYSJdLCJhcHBfZGlzcGxheW5hbWUi=
OiJNdXR0IiwiYXBwaWQiOiJlODZmNTkxMS04NGVjLTQ2MzUtYjY5YS0zMTNkMjlhYTM4NTgiLCJ=
hcHBpZGFjciI6IjAiLCJlbmZwb2xpZHMiOltdLCJmYW1pbHlfbmFtZSI6Iklhcm9wb2xpIiwiZ2=
l2ZW5fbmFtZSI6IkZyYW5jayIsImlwYWRkciI6IjIxNy4xNDAuMTA2LjM5IiwibmFtZSI6IkZyY=
W5jaytNS0yMS0xNzE1NTY3ODIxLTE2NDQ0OTE5MzctNzI1MzQ1NTQzLTkxOTQ1IiwicHVpZCI6I=
jEwMDM3RkZFOTE2MUZGNzUiLCJyaCI6IjAuQVJBQWVWbE84OWxYcWtxdFRiRWlwbUlZVFFJQUFB=
QUFBUEVQemdBQUFBQUFBQUFRQU1JLiIsInNjcCI6IklNQVAuQWNjZXNzQXNVc2VyLkFsbCBQT1A=
uQWNjZXNzQXNVc2VyLkFsbCBTTVRQLlNlbmQiLCJzaWQiOiJkMTExZGM4Ni00NGUxLTRiZjktYT=
k4ZS0yYThmYjA2NTU3NTMiLCJzaWduaW5fc3RhdGUiOlsiaW5rbm93bm50d2siXSwic3ViIjoic=
WNkVFI0bnE2MUJuZGU1YTRrS3dTM2tnMmVybUhjaDRSem10YXU2SkpCMCIsInRpZCI6ImYzNGU1=
OTc5LTU3ZDktNGFhYS1hZDRkLWIxMjJhNjYyMTg0ZCIsInVuaXF1ZV9uYW1lIjoiRnJhbmNrLkl=
hcm9wb2xpQGFybS5jb20iLCJ1cG4iOiJGcmFuY2suSWFyb3BvbGlAYXJtLmNvbSIsInV0aSI6Ij=
J4eVBpZG41Q2txdy1fbWdpTzhOQUEiLCJ2ZXIiOiIxLjAiLCJ3aWRzIjpbIjcyOTgyN2UzLTljM=
TQtNDlmNy1iYjFiLTk2MDhmMTU2YmJiOCIsImZlOTMwYmU3LTVlNjItNDdkYi05MWFmLTk4YzNh=
NDlhMzhiMSIsImI3OWZiZjRkLTNlZjktNDY4OS04MTQzLTc2YjE5NGU4NTUwOSJdfQ.fAjkZGM1=
Z5XQ7R1xD3raGuNbJzgcaWKKb5FS-MM1sFoGS8PdCS--0oWCi2VD7X43fgXaAWoHjMMCbXpTjF5=
69gaQCEMCH-QelxRx_nQi7kk7N6ljWMFULLufIWyNegSVun8M_VqnxBxxPfdGZLqdxfKZAxFAM3=
YMY4d_-W2uSzBGFprF5PpT644O3Coro1ir1pWaRRhpOgY78HRbZEH8vfeG_L763STjWmTVGNeEw=
5cIR8_AcdgJaHWfP4DrwOcD3n5MmqlrQrfM9h1Ev6LaaX_0FPlmBmOOyBxH90o2JAFoEV3wG1kO=
ghxTAmmG8SH_TUV4xISbi9XOBJa1dmZXuQ
IMAP authentication succeeded
POP authentication FAILED (does your account allow POP?): -ERR
Authentication failure: unknown user name or bad password.
SMTP authentication succeeded

IMAP and SMTP authentication should be marked as succeeded.

Note:

If IMAP and SMTP authentication are not working:

Check you network connection
Check that all settings in mutt_oauth2.py script are correct

The client_id which is e86f5911-84ec-4635-b69a-313d29aa3858
Your GPG identity in ENCRYPTION_PIPE variable

Restart the tokens creation process.

Delete the file that contains your tokens (in this example
franck.iaropoli@arm.com.tokens file)
Redo all the steps in the previous paragraph "create tokens" (running
script mutt_oauth2.py with the path to your tokens file, the verbose
and authorize options)

Configure Mutt

You now need to add below additional settings to your Mutt config file
to start using OAuth2 authentication (settings between <> must be
changed)

# setup modern auth
set imap_user=3D"<your Arm email address"
set folder=3D"imaps://outlook.office365.com:993/"
set smtp_url=3D"smtp://${imap_user}@smtp.office365.com:587/"
set imap_authenticators=3D"xoauth2"
set imap_oauth_refresh_command=3D"<path to mutt_oauth2.py script> <name
of the tokens file>"
set smtp_authenticators=3D${imap_authenticators}
set smtp_oauth_refresh_command=3D${imap_oauth_refresh_command}

For example:

# setup modern auth
set imap_user=3D"franck.iaropoli@arm.com"
set folder=3D"imaps://outlook.office365.com:993/"
set smtp_url=3D"smtp://${imap_user}@smtp.office365.com:587/"
set imap_authenticators=3D"xoauth2"
set imap_oauth_refresh_command=3D"/home/fraiar01/mutt_oauth2.py
${imap_user}.tokens"
set smtp_authenticators=3D${imap_authenticators}
set smtp_oauth_refresh_command=3D${imap_oauth_refresh_command}

Note:

You will be asked to re-enter your passphrase to access your tokens
and to renew them.

Known limitations

At present, mutt_oauth2.py access tokens have a limited lifetime,
meaning they must be regenerated every couple of hours.



On Sat, 7 May 2022 at 15:18, Chris Howard <cvz185@web.de> wrote:
> PS. In plain gdb (ie. no nice user interface) a large number (but not all=
) of the system registers gets displayed after each step. It would be nice =
if these were sorted in some way. At the moment they=E2=80=99re completely =
jumbled =E2=80=94 not alphabetic, not grouped by EL, nor by =E2=80=9Cmeanin=
g=E2=80=9D  (DBGWVR0_EL1 isn=E2=80=99t necessarily next to DBGWCR0_EL1).
>
> Also, there are multiple (identical?) instances of =E2=80=9CDBGBVR=E2=80=
=9D and =E2=80=9CDBGBCR=E2=80=9D (and  =E2=80=9CDBGWVR=E2=80=9D and =E2=80=
=9CDBGWCR=E2=80=9D) rather than the expected =E2=80=9CDBGWVR0_EL1=E2=80=9D,=
 =E2=80=9CDBGWVR1_EL1=E2=80=9D etc.
>
> Would this be a QEMU or a GDB issue? Or isn=E2=80=99t it an issue at all?=
 :-)

My gdb doesn't do that. Basically QEMU provides gdb with some XML
telling it that the sysregs are present, but it's up to gdb at
what points it chooses to display what registers and how it does that.

The system register read access via the gdbstub is "best-effort"
on QEMU's part -- we implement it to the extent that it wasn't too
difficult to do, but there are some sharp edges, like the
register names not always being quite right, and also the way
that if you try to read a register that isn't supposed to be
accessible by the current EL you might find it's not correct.
Trying to read SP_EL2 while at EL2 is an example of that.

The reason register names are sometimes funny is that the
infrastructure for system registers within QEMU was originally
written with the assumption that the name strings were merely
for convenience when debugging QEMU itself, so it's sometimes
a bit careless about them. We only added the "tell GDB about
these" part later.

That said, adding the numbers into the watchpoint and breakpoint
registers would be pretty easy, so we should do that. That is,
in this code:
https://gitlab.com/qemu-project/qemu/-/blob/master/target/arm/helper.c#L656=
7
we should use g_strdup_printf() to create unique per-register
names, the same way we do for the PMU registers already here:
https://gitlab.com/qemu-project/qemu/-/blob/master/target/arm/helper.c#L663=
2

thanks
-- PMM

