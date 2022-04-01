Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9E6034EE5F7
	for <lists+qemu-devel@lfdr.de>; Fri,  1 Apr 2022 04:18:10 +0200 (CEST)
Received: from localhost ([::1]:46924 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1na6rZ-0001p6-OD
	for lists+qemu-devel@lfdr.de; Thu, 31 Mar 2022 22:18:09 -0400
Received: from eggs.gnu.org ([209.51.188.92]:51366)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dmiller423@gmail.com>)
 id 1na6pw-000073-HL; Thu, 31 Mar 2022 22:16:30 -0400
Received: from [2607:f8b0:4864:20::233] (port=41900
 helo=mail-oi1-x233.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <dmiller423@gmail.com>)
 id 1na6pu-00033m-8B; Thu, 31 Mar 2022 22:16:28 -0400
Received: by mail-oi1-x233.google.com with SMTP id e189so1439517oia.8;
 Thu, 31 Mar 2022 19:16:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=H7ghv0bp/cJevCMiHDxaZ6xUm8p66VFD3b8nhAQUQ70=;
 b=Jysz28o5Z2N9i0/1dzUHrKzX2abqvKkMvjhb//u/cc3BWw3NQxdthdWQF1wb+xXeMe
 OuaFQDvU+oOWtg/1E/uYkqrsBi8zGycXclcnRLYmg5t9KgKemL13xbddmSxsIc1XsnPp
 9vXt9Vn5RB9eyfJj4DgUc/zUbXJLSRiTpaxTmN1OFDwY+6YC4UTOy/fjQW/6LulkQaz5
 lY/qMXwlTgS3hXRD9YIh/IE2xLhZNX3uWZhXh5pye5z0+NrslNF1+S22jIftkjdnT8hx
 prv1t06LHThEErsOLhpPGL+UKiuA/XCrBSnui+ZFwpNuRVSeVHtqRX6lYHDPXOJvXnMH
 JQEg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=H7ghv0bp/cJevCMiHDxaZ6xUm8p66VFD3b8nhAQUQ70=;
 b=q7i+lOCPV6ghM/KlNyHS57tcP5Pl/LThQxiITJ0zGlHD9T01xmIXpgoRKAhrZfbaSz
 UFlF+aoxH26ZB4x66KRU2WZyzKcdW+FPU/PI70TQCXbJJfbgIitGeF1vij/2h5YDcxVB
 9caIg3rnFO9Qb8OFbM32Hk3hgifyFQU6pCA+mbNoFUmAJ2oFIj5+qy90hLAHTm1Bf3vQ
 CRZoDjpWTEkDwrnZNhGofU+TDmzbPPMY/+0YsU+uWJrAx5o/cxX1YWtYWJ3TRUWM0VFg
 vW3zl3+ll8QOd8t5+JZg5SB+sASeJVxE6xEAqQv3WAPsfsybQV7TcnWr/vcOHFAHSRZT
 +V2Q==
X-Gm-Message-State: AOAM531QUzzk/nZAsraX5vjZk2gXYXPVQKFnh9Ypzu4sQvDvgpYMbpty
 VYBVYymOoDJlA1olRrlIM+hyiWQxbn29+luW18g=
X-Google-Smtp-Source: ABdhPJyZi/Nc+AwyiZt8ucFRfJOFEbsJddww9G1w0Tt2YUd8cCrzKCMCArOysloNVwITyy39yr/J8Pm7NEzlsmXbJj0=
X-Received: by 2002:aca:2b14:0:b0:2ef:89b7:a885 with SMTP id
 i20-20020aca2b14000000b002ef89b7a885mr3882232oik.16.1648779383688; Thu, 31
 Mar 2022 19:16:23 -0700 (PDT)
MIME-Version: 1.0
References: <20220322000441.26495-1-dmiller423@gmail.com>
 <20220322000441.26495-11-dmiller423@gmail.com>
 <c3bb72da-c390-f9b5-5254-f8c16df21427@redhat.com>
 <6409f049-d938-0e06-3cea-5877b31fce00@redhat.com>
 <95ad366c-509d-d41f-209b-dc66054de4b8@redhat.com>
 <CAEgyohVUHa+yd-inLOv3zTf143-_2Z35+K_XatUz74bqxDK9CA@mail.gmail.com>
 <CAEgyohWR6C1z8OyuGwkv8LT-P5fR9eVsCFw4LmGUxZCDNszoSg@mail.gmail.com>
In-Reply-To: <CAEgyohWR6C1z8OyuGwkv8LT-P5fR9eVsCFw4LmGUxZCDNszoSg@mail.gmail.com>
From: David Miller <dmiller423@gmail.com>
Date: Thu, 31 Mar 2022 22:16:12 -0400
Message-ID: <CAEgyohUYQ_-iGgqJSi-4P7Pk-d8cX8jo_L4pCuUPm4wfk=0YxA@mail.gmail.com>
Subject: Re: [PATCH v4 10/11] tests/tcg/s390x: Tests for Vector Enhancements
 Facility 2
To: Thomas Huth <thuth@redhat.com>
Content-Type: multipart/mixed; boundary="0000000000007a815e05db8e5d61"
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::233
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::233;
 envelope-from=dmiller423@gmail.com; helo=mail-oi1-x233.google.com
X-Spam_score_int: -3
X-Spam_score: -0.4
X-Spam_bar: /
X-Spam_report: (-0.4 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 FREEMAIL_ENVFROM_END_DIGIT=0.25, FREEMAIL_FROM=0.001, PDS_HP_HELO_NORDNS=0.659,
 RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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
Cc: farman@linux.ibm.com, David Hildenbrand <david@redhat.com>,
 cohuck@redhat.com, Richard Henderson <richard.henderson@linaro.org>,
 qemu-devel@nongnu.org, pasic@linux.ibm.com, qemu-s390x@nongnu.org,
 Christian Borntraeger <borntraeger@linux.ibm.com>,
 =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--0000000000007a815e05db8e5d61
Content-Type: text/plain; charset="UTF-8"

On Thu, Mar 31, 2022 at 10:15 PM David Miller <dmiller423@gmail.com> wrote:
>
> Hi,
>
> There is some issue with instruction sub/alt encodings not matching,
> but I worked around it easily.
>
> I'm dropping the updated patch for the tests in here.
> I know I should resend the entire patch series as a higher version
> really, and will do so.
> I'm hoping someone can tell me if it's ok to use .insn vrr  in place
> of vri(-d) as it doesn't match vri.
> [https://sourceware.org/binutils/docs-2.37/as/s390-Formats.html]
>
> .insn doesn't deal with sub encodings and there is no good alternative
> that I know of.
>
> example:
>
>     /* vri-d as vrr */
>     asm volatile(".insn vrr, 0xE70000000086, %[v1], %[v2], %[v3], 0, %[I], 0\n"
>                 : [v1] "=v" (v1->v)
>                 : [v2]  "v" (v2->v)
>                 , [v3]  "v" (v3->v)
>                 , [I]   "i" (I & 7));
>
> Patch is attached
>
>
> Thanks
> - David Miller
>
>
> On Thu, Mar 31, 2022 at 2:26 PM David Miller <dmiller423@gmail.com> wrote:
> >
> > Sorry,
> >    Didn't notice this, as it was on v4 patch emails.
> > I assume since there is no other follow up after a week,
> >  CI jobs are not being updated and I should change samples to use .insn.
> > I will try to get this out tomorrow.
> >
> > Thanks,
> > - David Miller
> >
> > On Wed, Mar 23, 2022 at 1:13 PM Thomas Huth <thuth@redhat.com> wrote:
> > >
> > > On 22/03/2022 11.31, Thomas Huth wrote:
> > > > On 22/03/2022 09.53, David Hildenbrand wrote:
> > > >> On 22.03.22 01:04, David Miller wrote:
> > > > [...]
> > > >>> diff --git a/tests/tcg/s390x/Makefile.target
> > > >>> b/tests/tcg/s390x/Makefile.target
> > > >>> index 8c9b6a13ce..921a056dd1 100644
> > > >>> --- a/tests/tcg/s390x/Makefile.target
> > > >>> +++ b/tests/tcg/s390x/Makefile.target
> > > >>> @@ -16,6 +16,14 @@ TESTS+=shift
> > > >>>   TESTS+=trap
> > > >>>   TESTS+=signals-s390x
> > > >>> +VECTOR_TESTS=vxeh2_vs
> > > >>> +VECTOR_TESTS+=vxeh2_vcvt
> > > >>> +VECTOR_TESTS+=vxeh2_vlstr
> > > >>> +
> > > >>> +TESTS+=$(VECTOR_TESTS)
> > > >>> +
> > > >>> +$(VECTOR_TESTS): CFLAGS+=-march=z15 -O2
> > > >>
> > > >> @Thomas, will that survive our test framework already, or do we have to
> > > >> wait for the debain11 changes?
> > > >
> > > > Alex' update to the container has already been merged:
> > > >
> > > > https://gitlab.com/qemu-project/qemu/-/commit/89767579cad2e371b
> > > >
> > > > ... and seems like it's working in Travis on s390x, too:
> > > >
> > > > https://app.travis-ci.com/github/huth/qemu/jobs/564188977#L12797
> > > >
> > > > ... so it seems like it should be OK now (considering that we drop support
> > > > for the old Ubuntu version 18.04 in QEMU 7.1, too).
> > >
> > > Looks like I spoke a little bit too soon - some of the CI pipelines are
> > > still using Debian 10 for running the TCG tests, and they are failing with
> > > these patches applied:
> > >
> > > https://gitlab.com/thuth/qemu/-/jobs/2238422870#L3499
> > >
> > > Thus we either need to update the CI jobs to use Debian 11, or use
> > > handcrafted instruction opcodes here again...
> > >
> > >   Thomas
> > >

--0000000000007a815e05db8e5d61
Content-Type: text/x-patch; charset="US-ASCII"; 
	name="v5-0010-tests-tcg-s390x-Tests-for-Vector-Enhancements-Fac.patch"
Content-Disposition: attachment; 
	filename="v5-0010-tests-tcg-s390x-Tests-for-Vector-Enhancements-Fac.patch"
Content-Transfer-Encoding: base64
Content-ID: <f_l1fso0wu0>
X-Attachment-Id: f_l1fso0wu0

RnJvbSBiYjZiZjJmOTUyOWM0ZDc2ZGI5YTllZmYyZmY3ZmExMjM1NjU3MTAzIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBEYXZpZCBNaWxsZXIgPGRtaWxsZXI0MjNAZ21haWwuY29tPgpE
YXRlOiBNb24sIDIxIE1hciAyMDIyIDE2OjU4OjU3IC0wNDAwClN1YmplY3Q6IFtQQVRDSCB2NSAx
MC8xMV0gdGVzdHMvdGNnL3MzOTB4OiBUZXN0cyBmb3IgVmVjdG9yIEVuaGFuY2VtZW50cwogRmFj
aWxpdHkgMgoKU2lnbmVkLW9mZi1ieTogRGF2aWQgTWlsbGVyIDxkbWlsbGVyNDIzQGdtYWlsLmNv
bT4KLS0tCiB0ZXN0cy90Y2cvczM5MHgvTWFrZWZpbGUudGFyZ2V0IHwgICA4ICsrCiB0ZXN0cy90
Y2cvczM5MHgvdnguaCAgICAgICAgICAgIHwgIDE5ICsrKysrCiB0ZXN0cy90Y2cvczM5MHgvdnhl
aDJfdmN2dC5jICAgIHwgIDg4ICsrKysrKysrKysrKysrKysrKysrCiB0ZXN0cy90Y2cvczM5MHgv
dnhlaDJfdmxzdHIuYyAgIHwgMTM5ICsrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrCiB0
ZXN0cy90Y2cvczM5MHgvdnhlaDJfdnMuYyAgICAgIHwgIDk1ICsrKysrKysrKysrKysrKysrKysr
KysKIDUgZmlsZXMgY2hhbmdlZCwgMzQ5IGluc2VydGlvbnMoKykKIGNyZWF0ZSBtb2RlIDEwMDY0
NCB0ZXN0cy90Y2cvczM5MHgvdnguaAogY3JlYXRlIG1vZGUgMTAwNjQ0IHRlc3RzL3RjZy9zMzkw
eC92eGVoMl92Y3Z0LmMKIGNyZWF0ZSBtb2RlIDEwMDY0NCB0ZXN0cy90Y2cvczM5MHgvdnhlaDJf
dmxzdHIuYwogY3JlYXRlIG1vZGUgMTAwNjQ0IHRlc3RzL3RjZy9zMzkweC92eGVoMl92cy5jCgpk
aWZmIC0tZ2l0IGEvdGVzdHMvdGNnL3MzOTB4L01ha2VmaWxlLnRhcmdldCBiL3Rlc3RzL3RjZy9z
MzkweC9NYWtlZmlsZS50YXJnZXQKaW5kZXggOGM5YjZhMTNjZS4uOTIxYTA1NmRkMSAxMDA2NDQK
LS0tIGEvdGVzdHMvdGNnL3MzOTB4L01ha2VmaWxlLnRhcmdldAorKysgYi90ZXN0cy90Y2cvczM5
MHgvTWFrZWZpbGUudGFyZ2V0CkBAIC0xNiw2ICsxNiwxNCBAQCBURVNUUys9c2hpZnQKIFRFU1RT
Kz10cmFwCiBURVNUUys9c2lnbmFscy1zMzkweAogCitWRUNUT1JfVEVTVFM9dnhlaDJfdnMKK1ZF
Q1RPUl9URVNUUys9dnhlaDJfdmN2dAorVkVDVE9SX1RFU1RTKz12eGVoMl92bHN0cgorCitURVNU
Uys9JChWRUNUT1JfVEVTVFMpCisKKyQoVkVDVE9SX1RFU1RTKTogQ0ZMQUdTKz0tbWFyY2g9ejE1
IC1PMgorCiBpZm5lcSAoJChIQVZFX0dEQl9CSU4pLCkKIEdEQl9TQ1JJUFQ9JChTUkNfUEFUSCkv
dGVzdHMvZ3Vlc3QtZGVidWcvcnVuLXRlc3QucHkKIApkaWZmIC0tZ2l0IGEvdGVzdHMvdGNnL3Mz
OTB4L3Z4LmggYi90ZXN0cy90Y2cvczM5MHgvdnguaApuZXcgZmlsZSBtb2RlIDEwMDY0NAppbmRl
eCAwMDAwMDAwMDAwLi4yZTY2ZjhiNzE0Ci0tLSAvZGV2L251bGwKKysrIGIvdGVzdHMvdGNnL3Mz
OTB4L3Z4LmgKQEAgLTAsMCArMSwxOSBAQAorI2lmbmRlZiBRRU1VX1RFU1RTX1MzOTBYX1ZYX0gK
KyNkZWZpbmUgUUVNVV9URVNUU19TMzkwWF9WWF9ICisKK3R5cGVkZWYgdW5pb24gUzM5MFZlY3Rv
ciB7CisgICAgdWludDY0X3QgZFsyXTsgIC8qIGRvdWJsZXdvcmQgKi8KKyAgICB1aW50MzJfdCB3
WzRdOyAgLyogd29yZCAqLworICAgIHVpbnQxNl90IGhbOF07ICAvKiBoYWxmd29yZCAqLworICAg
IHVpbnQ4X3QgIGJbMTZdOyAvKiBieXRlICovCisgICAgZmxvYXQgICAgZls0XTsgIC8qIGZsb2F0
MzIgKi8KKyAgICBkb3VibGUgICBmZFsyXTsgLyogZmxvYXQ2NCAqLworICAgIF9fdWludDEyOF90
IHY7Cit9IFMzOTBWZWN0b3I7CisKKyNkZWZpbmUgRVM4ICAwCisjZGVmaW5lIEVTMTYgMQorI2Rl
ZmluZSBFUzMyIDIKKyNkZWZpbmUgRVM2NCAzCisKKyNlbmRpZgpcIE5vIG5ld2xpbmUgYXQgZW5k
IG9mIGZpbGUKZGlmZiAtLWdpdCBhL3Rlc3RzL3RjZy9zMzkweC92eGVoMl92Y3Z0LmMgYi90ZXN0
cy90Y2cvczM5MHgvdnhlaDJfdmN2dC5jCm5ldyBmaWxlIG1vZGUgMTAwNjQ0CmluZGV4IDAwMDAw
MDAwMDAuLjJlNDY4NDFhYjUKLS0tIC9kZXYvbnVsbAorKysgYi90ZXN0cy90Y2cvczM5MHgvdnhl
aDJfdmN2dC5jCkBAIC0wLDAgKzEsODggQEAKKy8qCisgKiB2eGVoMl92Y3Z0OiB2ZWN0b3ItZW5o
YW5jZW1lbnRzIGZhY2lsaXR5IDIgdmVjdG9yIGNvbnZlcnQgKgorICovCisjaW5jbHVkZSA8c3Rk
aW50Lmg+CisjaW5jbHVkZSAidnguaCIKKworI2RlZmluZSBNX1MgOAorI2RlZmluZSBNNF9YeEMg
NAorI2RlZmluZSBNNF9kZWYgTTRfWHhDCisKK3N0YXRpYyBpbmxpbmUgdm9pZCB2Y2ZwcyhTMzkw
VmVjdG9yICp2MSwgUzM5MFZlY3RvciAqdjIsCisgICAgY29uc3QgdWludDhfdCBtMywgIGNvbnN0
IHVpbnQ4X3QgbTQsICBjb25zdCB1aW50OF90IG01KQoreworICAgIGFzbSB2b2xhdGlsZSgiLmlu
c24gdnJyLCAweEU3MDAwMDAwMDBDMywgJVt2MV0sICVbdjJdLCAwLCAlW20zXSwgJVttNF0sICVb
bTVdXG4iCisgICAgICAgICAgICAgICAgOiBbdjFdICI9diIgKHYxLT52KQorICAgICAgICAgICAg
ICAgIDogW3YyXSAgInYiICh2Mi0+dikKKyAgICAgICAgICAgICAgICAsIFttM10gICJpIiAobTMp
CisgICAgICAgICAgICAgICAgLCBbbTRdICAiaSIgKG00KQorICAgICAgICAgICAgICAgICwgW201
XSAgImkiIChtNSkpOworfQorCitzdGF0aWMgaW5saW5lIHZvaWQgdmNmcGwoUzM5MFZlY3RvciAq
djEsIFMzOTBWZWN0b3IgKnYyLAorICAgIGNvbnN0IHVpbnQ4X3QgbTMsICBjb25zdCB1aW50OF90
IG00LCAgY29uc3QgdWludDhfdCBtNSkKK3sKKyAgICBhc20gdm9sYXRpbGUoIi5pbnNuIHZyciwg
MHhFNzAwMDAwMDAwQzEsICVbdjFdLCAlW3YyXSwgMCwgJVttM10sICVbbTRdLCAlW201XVxuIgor
ICAgICAgICAgICAgICAgIDogW3YxXSAiPXYiICh2MS0+dikKKyAgICAgICAgICAgICAgICA6IFt2
Ml0gICJ2IiAodjItPnYpCisgICAgICAgICAgICAgICAgLCBbbTNdICAiaSIgKG0zKQorICAgICAg
ICAgICAgICAgICwgW200XSAgImkiIChtNCkKKyAgICAgICAgICAgICAgICAsIFttNV0gICJpIiAo
bTUpKTsKK30KKworc3RhdGljIGlubGluZSB2b2lkIHZjc2ZwKFMzOTBWZWN0b3IgKnYxLCBTMzkw
VmVjdG9yICp2MiwKKyAgICBjb25zdCB1aW50OF90IG0zLCAgY29uc3QgdWludDhfdCBtNCwgIGNv
bnN0IHVpbnQ4X3QgbTUpCit7CisgICAgYXNtIHZvbGF0aWxlKCIuaW5zbiB2cnIsIDB4RTcwMDAw
MDAwMEMyLCAlW3YxXSwgJVt2Ml0sIDAsICVbbTNdLCAlW200XSwgJVttNV1cbiIKKyAgICAgICAg
ICAgICAgICA6IFt2MV0gIj12IiAodjEtPnYpCisgICAgICAgICAgICAgICAgOiBbdjJdICAidiIg
KHYyLT52KQorICAgICAgICAgICAgICAgICwgW20zXSAgImkiIChtMykKKyAgICAgICAgICAgICAg
ICAsIFttNF0gICJpIiAobTQpCisgICAgICAgICAgICAgICAgLCBbbTVdICAiaSIgKG01KSk7Cit9
CisKK3N0YXRpYyBpbmxpbmUgdm9pZCB2Y2xmcChTMzkwVmVjdG9yICp2MSwgUzM5MFZlY3RvciAq
djIsCisgICAgY29uc3QgdWludDhfdCBtMywgIGNvbnN0IHVpbnQ4X3QgbTQsICBjb25zdCB1aW50
OF90IG01KQoreworICAgIGFzbSB2b2xhdGlsZSgiLmluc24gdnJyLCAweEU3MDAwMDAwMDBDMCwg
JVt2MV0sICVbdjJdLCAwLCAlW20zXSwgJVttNF0sICVbbTVdXG4iCisgICAgICAgICAgICAgICAg
OiBbdjFdICI9diIgKHYxLT52KQorICAgICAgICAgICAgICAgIDogW3YyXSAgInYiICh2Mi0+dikK
KyAgICAgICAgICAgICAgICAsIFttM10gICJpIiAobTMpCisgICAgICAgICAgICAgICAgLCBbbTRd
ICAiaSIgKG00KQorICAgICAgICAgICAgICAgICwgW201XSAgImkiIChtNSkpOworfQorCitpbnQg
bWFpbihpbnQgYXJnYywgY2hhciAqYXJndltdKQoreworICAgIFMzOTBWZWN0b3IgdmQ7CisgICAg
UzM5MFZlY3RvciB2c19pMzIgPSB7IC53WzBdID0gMSwgLndbMV0gPSA2NCwgLndbMl0gPSAxMDI0
LCAud1szXSA9IC0xMCB9OworICAgIFMzOTBWZWN0b3IgdnNfdTMyID0geyAud1swXSA9IDIsIC53
WzFdID0gMzIsIC53WzJdID0gNDA5NiwgLndbM10gPSA4ODg4IH07CisgICAgUzM5MFZlY3RvciB2
c19mMzIgPSB7IC5mWzBdID0gMy45ODcsIC5mWzFdID0gNS4xMjMsCisgICAgICAgICAgICAgICAg
ICAgICAgICAgIC5mWzJdID0gNC40OTksIC5mWzNdID0gMC41MTIgfTsKKworICAgIHZkLmRbMF0g
PSB2ZC5kWzFdID0gMDsKKyAgICB2Y2ZwcygmdmQsICZ2c19pMzIsIDIsIE00X2RlZiwgMCk7Cisg
ICAgaWYgKDEgIT0gdmQuZlswXSB8fCAxMDI0ICE9IHZkLmZbMl0gfHwgNjQgIT0gdmQuZlsxXSB8
fCAtMTAgIT0gdmQuZlszXSkgeworICAgICAgICByZXR1cm4gMTsKKyAgICB9CisKKyAgICB2ZC5k
WzBdID0gdmQuZFsxXSA9IDA7CisgICAgdmNmcGwoJnZkLCAmdnNfdTMyLCAyLCBNNF9kZWYsIDAp
OworICAgIGlmICgyICE9IHZkLmZbMF0gfHwgNDA5NiAhPSB2ZC5mWzJdIHx8IDMyICE9IHZkLmZb
MV0gfHwgODg4OCAhPSB2ZC5mWzNdKSB7CisgICAgICAgIHJldHVybiAxOworICAgIH0KKworICAg
IHZkLmRbMF0gPSB2ZC5kWzFdID0gMDsKKyAgICB2Y3NmcCgmdmQsICZ2c19mMzIsIDIsIE00X2Rl
ZiwgMCk7CisgICAgaWYgKDQgIT0gdmQud1swXSB8fCA0ICE9IHZkLndbMl0gfHwgNSAhPSB2ZC53
WzFdIHx8IDEgIT0gdmQud1szXSkgeworICAgICAgICByZXR1cm4gMTsKKyAgICB9CisKKyAgICB2
ZC5kWzBdID0gdmQuZFsxXSA9IDA7CisgICAgdmNsZnAoJnZkLCAmdnNfZjMyLCAyLCBNNF9kZWYs
IDApOworICAgIGlmICg0ICE9IHZkLndbMF0gfHwgNCAhPSB2ZC53WzJdIHx8IDUgIT0gdmQud1sx
XSB8fCAxICE9IHZkLndbM10pIHsKKyAgICAgICAgcmV0dXJuIDE7CisgICAgfQorCisgICAgcmV0
dXJuIDA7Cit9CmRpZmYgLS1naXQgYS90ZXN0cy90Y2cvczM5MHgvdnhlaDJfdmxzdHIuYyBiL3Rl
c3RzL3RjZy9zMzkweC92eGVoMl92bHN0ci5jCm5ldyBmaWxlIG1vZGUgMTAwNjQ0CmluZGV4IDAw
MDAwMDAwMDAuLjc3MDY5MWE0ZTgKLS0tIC9kZXYvbnVsbAorKysgYi90ZXN0cy90Y2cvczM5MHgv
dnhlaDJfdmxzdHIuYwpAQCAtMCwwICsxLDEzOSBAQAorLyoKKyAqIHZ4ZWgyX3Zsc3RyOiB2ZWN0
b3ItZW5oYW5jZW1lbnRzIGZhY2lsaXR5IDIgdmVjdG9yIGxvYWQvc3RvcmUgcmV2ZXJzZWQgKgor
ICovCisjaW5jbHVkZSA8c3RkaW50Lmg+CisjaW5jbHVkZSAidnguaCIKKworI2RlZmluZSB2dHN0
KHYxLCB2MikgXAorICAgIGlmICh2MS5kWzBdICE9IHYyLmRbMF0gfHwgdjEuZFsxXSAhPSB2Mi5k
WzFdKSB7IFwKKyAgICAgICAgcmV0dXJuIDE7ICAgICBcCisgICAgfQorCitzdGF0aWMgaW5saW5l
IHZvaWQgdmxlcihTMzkwVmVjdG9yICp2MSwgY29uc3Qgdm9pZCAqdmEsIHVpbnQ4X3QgbTMpCit7
CisgICAgYXNtIHZvbGF0aWxlKCIuaW5zbiB2cngsIDB4RTYwMDAwMDAwMDA3LCAlW3YxXSwgMCgl
W3ZhXSksICVbbTNdXG4iCisgICAgICAgICAgICAgICAgOiBbdjFdICIrdiIgKHYxLT52KQorICAg
ICAgICAgICAgICAgIDogW3ZhXSAgImQiICh2YSkKKyAgICAgICAgICAgICAgICAsIFttM10gICJp
IiAobTMpCisgICAgICAgICAgICAgICAgOiAibWVtb3J5Iik7Cit9CisKK3N0YXRpYyBpbmxpbmUg
dm9pZCB2c3RlcihTMzkwVmVjdG9yICp2MSwgY29uc3Qgdm9pZCAqdmEsIHVpbnQ4X3QgbTMpCit7
CisgICAgYXNtIHZvbGF0aWxlKCIuaW5zbiB2cngsIDB4RTYwMDAwMDAwMDBGLCAlW3YxXSwgMCgl
W3ZhXSksICVbbTNdXG4iCisgICAgICAgICAgICAgICAgOiBbdmFdICIrZCIgKHZhKQorICAgICAg
ICAgICAgICAgIDogW3YxXSAgInYiICh2MS0+dikKKyAgICAgICAgICAgICAgICAsIFttM10gICJp
IiAobTMpCisgICAgICAgICAgICAgICAgOiAibWVtb3J5Iik7Cit9CisKK3N0YXRpYyBpbmxpbmUg
dm9pZCB2bGJyKFMzOTBWZWN0b3IgKnYxLCB2b2lkICp2YSwgY29uc3QgdWludDhfdCBtMykKK3sK
KyAgICBhc20gdm9sYXRpbGUoIi5pbnNuIHZyeCwgMHhFNjAwMDAwMDAwMDYsICVbdjFdLCAwKCVb
dmFdKSwgJVttM11cbiIKKyAgICAgICAgICAgICAgICA6IFt2MV0gIit2IiAodjEtPnYpCisgICAg
ICAgICAgICAgICAgOiBbdmFdICAiZCIgKHZhKQorICAgICAgICAgICAgICAgICwgW20zXSAgImki
IChtMykKKyAgICAgICAgICAgICAgICA6ICJtZW1vcnkiKTsKK30KKworc3RhdGljIGlubGluZSB2
b2lkIHZzdGJyKFMzOTBWZWN0b3IgKnYxLCB2b2lkICp2YSwgY29uc3QgdWludDhfdCBtMykKK3sK
KyAgICBhc20gdm9sYXRpbGUoIi5pbnNuIHZyeCwgMHhFNjAwMDAwMDAwMEUsICVbdjFdLCAwKCVb
dmFdKSwgJVttM11cbiIKKyAgICAgICAgICAgICAgICA6IFt2YV0gIitkIiAodmEpCisgICAgICAg
ICAgICAgICAgOiBbdjFdICAidiIgKHYxLT52KQorICAgICAgICAgICAgICAgICwgW20zXSAgImki
IChtMykKKyAgICAgICAgICAgICAgICA6ICJtZW1vcnkiKTsKK30KKworCitzdGF0aWMgaW5saW5l
IHZvaWQgdmxlYnJoKFMzOTBWZWN0b3IgKnYxLCB2b2lkICp2YSwgY29uc3QgdWludDhfdCBtMykK
K3sKKyAgICBhc20gdm9sYXRpbGUoIi5pbnNuIHZyeCwgMHhFNjAwMDAwMDAwMDEsICVbdjFdLCAw
KCVbdmFdKSwgJVttM11cbiIKKyAgICAgICAgICAgICAgICA6IFt2MV0gIit2IiAodjEtPnYpCisg
ICAgICAgICAgICAgICAgOiBbdmFdICAiZCIgKHZhKQorICAgICAgICAgICAgICAgICwgW20zXSAg
ImkiIChtMykKKyAgICAgICAgICAgICAgICA6ICJtZW1vcnkiKTsKK30KKworc3RhdGljIGlubGlu
ZSB2b2lkIHZzdGVicmgoUzM5MFZlY3RvciAqdjEsIHZvaWQgKnZhLCBjb25zdCB1aW50OF90IG0z
KQoreworICAgIGFzbSB2b2xhdGlsZSgiLmluc24gdnJ4LCAweEU2MDAwMDAwMDAwOSwgJVt2MV0s
IDAoJVt2YV0pLCAlW20zXVxuIgorICAgICAgICAgICAgICAgIDogW3ZhXSAiK2QiICh2YSkKKyAg
ICAgICAgICAgICAgICA6IFt2MV0gICJ2IiAodjEtPnYpCisgICAgICAgICAgICAgICAgLCBbbTNd
ICAiaSIgKG0zKQorICAgICAgICAgICAgICAgIDogIm1lbW9yeSIpOworfQorCitzdGF0aWMgaW5s
aW5lIHZvaWQgdmxsZWJyeihTMzkwVmVjdG9yICp2MSwgdm9pZCAqdmEsIGNvbnN0IHVpbnQ4X3Qg
bTMpCit7CisgICAgYXNtIHZvbGF0aWxlKCIuaW5zbiB2cngsIDB4RTYwMDAwMDAwMDA0LCAlW3Yx
XSwgMCglW3ZhXSksICVbbTNdXG4iCisgICAgICAgICAgICAgICAgOiBbdjFdICIrdiIgKHYxLT52
KQorICAgICAgICAgICAgICAgIDogW3ZhXSAgImQiICh2YSkKKyAgICAgICAgICAgICAgICAsIFtt
M10gICJpIiAobTMpCisgICAgICAgICAgICAgICAgOiAibWVtb3J5Iik7Cit9CisKK3N0YXRpYyBp
bmxpbmUgdm9pZCB2bGJycmVwKFMzOTBWZWN0b3IgKnYxLCB2b2lkICp2YSwgY29uc3QgdWludDhf
dCBtMykKK3sKKyAgICBhc20gdm9sYXRpbGUoIi5pbnNuIHZyeCwgMHhFNjAwMDAwMDAwMDUsICVb
djFdLCAwKCVbdmFdKSwgJVttM11cbiIKKyAgICAgICAgICAgICAgICA6IFt2MV0gIit2IiAodjEt
PnYpCisgICAgICAgICAgICAgICAgOiBbdmFdICAiZCIgKHZhKQorICAgICAgICAgICAgICAgICwg
W20zXSAgImkiIChtMykKKyAgICAgICAgICAgICAgICA6ICJtZW1vcnkiKTsKK30KKworaW50IG1h
aW4oaW50IGFyZ2MsIGNoYXIgKmFyZ3ZbXSkKK3sKKyAgICBTMzkwVmVjdG9yIHZkID0geyAuZFsw
XSA9IDAsIC5kWzFdID0gMCB9OworICAgIFMzOTBWZWN0b3IgdnMgPSB7IC5kWzBdID0gMHg4RkVF
RERDQ0JCQUE5OTg4dWxsLAorICAgICAgICAgICAgICAgICAgICAgIC5kWzFdID0gMHg3NzY2NTU0
NDMzMjIxMTA3dWxsIH07CisKKyAgICBjb25zdCBTMzkwVmVjdG9yIHZ0X3ZfZXIxNiA9IHsKKyAg
ICAgICAgLmhbMF0gPSAweDExMDcsIC5oWzFdID0gMHgzMzIyLCAuaFsyXSA9IDB4NTU0NCwgLmhb
M10gPSAweDc3NjYsCisgICAgICAgIC5oWzRdID0gMHg5OTg4LCAuaFs1XSA9IDB4QkJBQSwgLmhb
Nl0gPSAweEREQ0MsIC5oWzddID0gMHg4RkVFIH07CisKKyAgICBjb25zdCBTMzkwVmVjdG9yIHZ0
X3ZfYnIxNiA9IHsKKyAgICAgICAgLmhbMF0gPSAweEVFOEYsIC5oWzFdID0gMHhDQ0RELCAuaFsy
XSA9IDB4QUFCQiwgLmhbM10gPSAweDg4OTksCisgICAgICAgIC5oWzRdID0gMHg2Njc3LCAuaFs1
XSA9IDB4NDQ1NSwgLmhbNl0gPSAweDIyMzMsIC5oWzddID0gMHgwNzExIH07CisKKyAgICBpbnQg
aXg7CisgICAgdWludDY0X3Qgc3M2NCA9IDB4RkVFREZBQ0UwQkFEQkVFRnVsbCwgc2Q2NCA9IDA7
CisKKyAgICB2bGVyKCZ2ZCwgJnZzLCBFUzE2KTsKKyAgICB2dHN0KHZkLCB2dF92X2VyMTYpOwor
CisgICAgdnN0ZXIoJnZzLCAmdmQsIEVTMTYpOworICAgIHZ0c3QodmQsIHZ0X3ZfZXIxNik7CisK
KyAgICB2bGJyKCZ2ZCwgJnZzLCBFUzE2KTsKKyAgICB2dHN0KHZkLCB2dF92X2JyMTYpOworCisg
ICAgdnN0YnIoJnZzLCAmdmQsIEVTMTYpOworICAgIHZ0c3QodmQsIHZ0X3ZfYnIxNik7CisKKyAg
ICB2bGVicmgoJnZkLCAmc3M2NCwgNSk7CisgICAgaWYgKDB4RURGRSAhPSB2ZC5oWzVdKSB7Cisg
ICAgICAgIHJldHVybiAxOworICAgIH0KKworICAgIHZzdGVicmgoJnZzLCAodWludDhfdCAqKSZz
ZDY0ICsgNCwgNyk7CisgICAgaWYgKDB4MDAwMDAwMDAwNzExMDAwMHVsbCAhPSBzZDY0KSB7Cisg
ICAgICAgIHJldHVybiAxOworICAgIH0KKworICAgIHZsbGVicnooJnZkLCAodWludDhfdCAqKSZz
czY0ICsgMywgMik7CisgICAgZm9yIChpeCA9IDA7IGl4IDwgNDsgaXgrKykgeworICAgICAgICBp
ZiAodmQud1tpeF0gIT0gKGl4ICE9IDEgPyAwIDogMHhCRUFEMEJDRSkpIHsKKyAgICAgICAgICAg
IHJldHVybiAxOworICAgICAgICB9CisgICAgfQorCisgICAgdmxicnJlcCgmdmQsICh1aW50OF90
ICopJnNzNjQgKyA0LCAxKTsKKyAgICBmb3IgKGl4ID0gMDsgaXggPCA4OyBpeCsrKSB7CisgICAg
ICAgIGlmICgweEFEMEIgIT0gdmQuaFtpeF0pIHsKKyAgICAgICAgICAgIHJldHVybiAxOworICAg
ICAgICB9CisgICAgfQorCisgICAgcmV0dXJuIDA7Cit9CmRpZmYgLS1naXQgYS90ZXN0cy90Y2cv
czM5MHgvdnhlaDJfdnMuYyBiL3Rlc3RzL3RjZy9zMzkweC92eGVoMl92cy5jCm5ldyBmaWxlIG1v
ZGUgMTAwNjQ0CmluZGV4IDAwMDAwMDAwMDAuLjc4ZjVjOWE4YmUKLS0tIC9kZXYvbnVsbAorKysg
Yi90ZXN0cy90Y2cvczM5MHgvdnhlaDJfdnMuYwpAQCAtMCwwICsxLDk1IEBACisvKgorICogdnhl
aDJfdnM6IHZlY3Rvci1lbmhhbmNlbWVudHMgZmFjaWxpdHkgMiB2ZWN0b3Igc2hpZnQKKyAqLwor
I2luY2x1ZGUgPHN0ZGludC5oPgorI2luY2x1ZGUgInZ4LmgiCisKKyNkZWZpbmUgdnRzdCh2MSwg
djIpIFwKKyAgICBpZiAodjEuZFswXSAhPSB2Mi5kWzBdIHx8IHYxLmRbMV0gIT0gdjIuZFsxXSkg
eyBcCisgICAgICAgIHJldHVybiAxOyAgICAgXAorICAgIH0KKworc3RhdGljIGlubGluZSB2b2lk
IHZzbChTMzkwVmVjdG9yICp2MSwgUzM5MFZlY3RvciAqdjIsIFMzOTBWZWN0b3IgKnYzKQorewor
ICAgIGFzbSB2b2xhdGlsZSgiLmluc24gdnJyLCAweEU3MDAwMDAwMDA3NCwgJVt2MV0sICVbdjJd
LCAlW3YzXSwgMCwwLDBcbiIKKyAgICAgICAgICAgICAgICA6IFt2MV0gIj12IiAodjEtPnYpCisg
ICAgICAgICAgICAgICAgOiBbdjJdICAidiIgKHYyLT52KQorICAgICAgICAgICAgICAgICwgW3Yz
XSAgInYiICh2My0+dikpOworfQorCitzdGF0aWMgaW5saW5lIHZvaWQgdnNyYShTMzkwVmVjdG9y
ICp2MSwgUzM5MFZlY3RvciAqdjIsIFMzOTBWZWN0b3IgKnYzKQoreworICAgIGFzbSB2b2xhdGls
ZSgiLmluc24gdnJyLCAweEU3MDAwMDAwMDA3RSwgJVt2MV0sICVbdjJdLCAlW3YzXSwgMCwwLDBc
biIKKyAgICAgICAgICAgICAgICA6IFt2MV0gIj12IiAodjEtPnYpCisgICAgICAgICAgICAgICAg
OiBbdjJdICAidiIgKHYyLT52KQorICAgICAgICAgICAgICAgICwgW3YzXSAgInYiICh2My0+dikp
OworfQorCitzdGF0aWMgaW5saW5lIHZvaWQgdnNybChTMzkwVmVjdG9yICp2MSwgUzM5MFZlY3Rv
ciAqdjIsIFMzOTBWZWN0b3IgKnYzKQoreworICAgIGFzbSB2b2xhdGlsZSgiLmluc24gdnJyLCAw
eEU3MDAwMDAwMDA3QywgJVt2MV0sICVbdjJdLCAlW3YzXSwgMCwwLDBcbiIKKyAgICAgICAgICAg
ICAgICA6IFt2MV0gIj12IiAodjEtPnYpCisgICAgICAgICAgICAgICAgOiBbdjJdICAidiIgKHYy
LT52KQorICAgICAgICAgICAgICAgICwgW3YzXSAgInYiICh2My0+dikpOworfQorCitzdGF0aWMg
aW5saW5lIHZvaWQgdnNsZChTMzkwVmVjdG9yICp2MSwgUzM5MFZlY3RvciAqdjIsCisgICAgUzM5
MFZlY3RvciAqdjMsIGNvbnN0IHVpbnQ4X3QgSSkKK3sKKyAgICAvKiB2cmktZCBhcyB2cnIgKi8K
KyAgICBhc20gdm9sYXRpbGUoIi5pbnNuIHZyciwgMHhFNzAwMDAwMDAwODYsICVbdjFdLCAlW3Yy
XSwgJVt2M10sIDAsICVbSV0sIDBcbiIKKyAgICAgICAgICAgICAgICA6IFt2MV0gIj12IiAodjEt
PnYpCisgICAgICAgICAgICAgICAgOiBbdjJdICAidiIgKHYyLT52KQorICAgICAgICAgICAgICAg
ICwgW3YzXSAgInYiICh2My0+dikKKyAgICAgICAgICAgICAgICAsIFtJXSAgICJpIiAoSSAmIDcp
KTsKK30KKworc3RhdGljIGlubGluZSB2b2lkIHZzcmQoUzM5MFZlY3RvciAqdjEsIFMzOTBWZWN0
b3IgKnYyLAorICAgIFMzOTBWZWN0b3IgKnYzLCBjb25zdCB1aW50OF90IEkpCit7CisgICAgLyog
dnJpLWQgYXMgdnJyICovCisgICAgYXNtIHZvbGF0aWxlKCIuaW5zbiB2cnIsIDB4RTcwMDAwMDAw
MDg3LCAlW3YxXSwgJVt2Ml0sICVbdjNdLCAwLCAlW0ldLCAwXG4iCisgICAgICAgICAgICAgICAg
OiBbdjFdICI9diIgKHYxLT52KQorICAgICAgICAgICAgICAgIDogW3YyXSAgInYiICh2Mi0+dikK
KyAgICAgICAgICAgICAgICAsIFt2M10gICJ2IiAodjMtPnYpCisgICAgICAgICAgICAgICAgLCBb
SV0gICAiaSIgKEkgJiA3KSk7Cit9CisKK2ludCBtYWluKGludCBhcmdjLCBjaGFyICphcmd2W10p
Cit7CisgICAgY29uc3QgUzM5MFZlY3RvciB2dF92c2wgID0geyAuZFswXSA9IDB4N0ZFREJCMzJE
NUFBMzExRHVsbCwKKyAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIC5kWzFdID0gMHhC
QjY1QUExMDkxMjIyMEMwdWxsIH07CisgICAgY29uc3QgUzM5MFZlY3RvciB2dF92c3JhID0geyAu
ZFswXSA9IDB4RjFGRTZFNzM5OUFBNTQ2NnVsbCwKKyAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgIC5kWzFdID0gMHgwRTc2MkE1MTg4MjIxMDQ0dWxsIH07CisgICAgY29uc3QgUzM5MFZl
Y3RvciB2dF92c3JsID0geyAuZFswXSA9IDB4MTFGRTZFNzM5OUFBNTQ2NnVsbCwKKyAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgIC5kWzFdID0gMHgwRTc2MkE1MTg4MjIxMDQ0dWxsIH07
CisgICAgY29uc3QgUzM5MFZlY3RvciB2dF92c2xkID0geyAuZFswXSA9IDB4N0Y3NkVFNjVERDU0
Q0M0M3VsbCwKKyAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIC5kWzFdID0gMHhCQjMy
QUEyMTk5MTA4ODM4dWxsIH07CisgICAgY29uc3QgUzM5MFZlY3RvciB2dF92c3JkID0geyAuZFsw
XSA9IDB4MEUwNjA4MDIwNDBFMDAwQXVsbCwKKyAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgIC5kWzFdID0gMHgwQzA2MDgwMjA0MEUwMDBBdWxsIH07CisgICAgUzM5MFZlY3RvciB2cyAg
PSB7IC5kWzBdID0gMHg4RkVFRERDQ0JCQUE5OTg4dWxsLAorICAgICAgICAgICAgICAgICAgICAg
ICAuZFsxXSA9IDB4Nzc2NjU1NDQzMzIyMTEwN3VsbCB9OworICAgIFMzOTBWZWN0b3IgIHZkID0g
eyAuZFswXSA9IDAsIC5kWzFdID0gMCB9OworICAgIFMzOTBWZWN0b3IgdnNpID0geyAuZFswXSA9
IDAsIC5kWzFdID0gMCB9OworCisgICAgZm9yIChpbnQgaXggPSAwOyBpeCA8IDE2OyBpeCsrKSB7
CisgICAgICAgIHZzaS5iW2l4XSA9ICgxICsgKDUgXiB+aXgpKSAmIDc7CisgICAgfQorCisgICAg
dnNsKCZ2ZCwgJnZzLCAmdnNpKTsKKyAgICB2dHN0KHZkLCB2dF92c2wpOworCisgICAgdnNyYSgm
dmQsICZ2cywgJnZzaSk7CisgICAgdnRzdCh2ZCwgdnRfdnNyYSk7CisKKyAgICB2c3JsKCZ2ZCwg
JnZzLCAmdnNpKTsKKyAgICB2dHN0KHZkLCB2dF92c3JsKTsKKworICAgIHZzbGQoJnZkLCAmdnMs
ICZ2c2ksIDMpOworICAgIHZ0c3QodmQsIHZ0X3ZzbGQpOworCisgICAgdnNyZCgmdmQsICZ2cywg
JnZzaSwgMTUpOworICAgIHZ0c3QodmQsIHZ0X3ZzcmQpOworCisgICAgcmV0dXJuIDA7Cit9Ci0t
IAoyLjMyLjAKCg==
--0000000000007a815e05db8e5d61--

