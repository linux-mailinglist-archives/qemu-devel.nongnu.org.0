Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DEE13DBDDD
	for <lists+qemu-devel@lfdr.de>; Fri, 18 Oct 2019 08:49:42 +0200 (CEST)
Received: from localhost ([::1]:35726 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1iLM4z-0005eP-Pe
	for lists+qemu-devel@lfdr.de; Fri, 18 Oct 2019 02:49:41 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53768)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <thuth@redhat.com>) id 1iLM43-0005F3-Qb
 for qemu-devel@nongnu.org; Fri, 18 Oct 2019 02:48:45 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <thuth@redhat.com>) id 1iLM40-0001is-VD
 for qemu-devel@nongnu.org; Fri, 18 Oct 2019 02:48:42 -0400
Received: from mx1.redhat.com ([209.132.183.28]:50298)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <thuth@redhat.com>) id 1iLM40-0001he-MS
 for qemu-devel@nongnu.org; Fri, 18 Oct 2019 02:48:40 -0400
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id 884FEC028358
 for <qemu-devel@nongnu.org>; Fri, 18 Oct 2019 06:48:38 +0000 (UTC)
Received: from thuth.remote.csb (dhcp-200-228.str.redhat.com [10.33.200.228])
 by smtp.corp.redhat.com (Postfix) with ESMTP id C2E6F600C1;
 Fri, 18 Oct 2019 06:48:28 +0000 (UTC)
Subject: Re: [PATCH v2 7/7] libqos: add VIRTIO PCI 1.0 support
From: Thomas Huth <thuth@redhat.com>
To: Stefan Hajnoczi <stefanha@redhat.com>
References: <20191011085611.4194-1-stefanha@redhat.com>
 <20191011085611.4194-8-stefanha@redhat.com>
 <e7821640-de44-5e65-b9c1-2534dc676690@redhat.com>
 <20191017160735.GB1266@stefanha-x1.localdomain>
 <d803e58f-f0cc-b13b-6041-682497c6fe2f@redhat.com>
Openpgp: preference=signencrypt
Autocrypt: addr=thuth@redhat.com; prefer-encrypt=mutual; keydata=
 mQINBFH7eUwBEACzyOXKU+5Pcs6wNpKzrlJwzRl3VGZt95VCdb+FgoU9g11m7FWcOafrVRwU
 yYkTm9+7zBUc0sW5AuPGR/dp3pSLX/yFWsA/UB4nJsHqgDvDU7BImSeiTrnpMOTXb7Arw2a2
 4CflIyFqjCpfDM4MuTmzTjXq4Uov1giGE9X6viNo1pxyEpd7PanlKNnf4PqEQp06X4IgUacW
 tSGj6Gcns1bCuHV8OPWLkf4hkRnu8hdL6i60Yxz4E6TqlrpxsfYwLXgEeswPHOA6Mn4Cso9O
 0lewVYfFfsmokfAVMKWzOl1Sr0KGI5T9CpmRfAiSHpthhHWnECcJFwl72NTi6kUcUzG4se81
 O6n9d/kTj7pzTmBdfwuOZ0YUSqcqs0W+l1NcASSYZQaDoD3/SLk+nqVeCBB4OnYOGhgmIHNW
 0CwMRO/GK+20alxzk//V9GmIM2ACElbfF8+Uug3pqiHkVnKqM7W9/S1NH2qmxB6zMiJUHlTH
 gnVeZX0dgH27mzstcF786uPcdEqS0KJuxh2kk5IvUSL3Qn3ZgmgdxBMyCPciD/1cb7/Ahazr
 3ThHQXSHXkH/aDXdfLsKVuwDzHLVSkdSnZdt5HHh75/NFHxwaTlydgfHmFFwodK8y/TjyiGZ
 zg2Kje38xnz8zKn9iesFBCcONXS7txENTzX0z80WKBhK+XSFJwARAQABtB5UaG9tYXMgSHV0
 aCA8dGh1dGhAcmVkaGF0LmNvbT6JAjgEEwECACIFAlVgX6oCGwMGCwkIBwMCBhUIAgkKCwQW
 AgMBAh4BAheAAAoJEC7Z13T+cC21EbIP/ii9cvT2HHGbFRl8HqGT6+7Wkb+XLMqJBMAIGiQK
 QIP3xk1HPTsLfVG0ao4hy/oYkGNOP8+ubLnZen6Yq3zAFiMhQ44lvgigDYJo3Ve59gfe99KX
 EbtB+X95ODARkq0McR6OAsPNJ7gpEUzfkQUUJTXRDQXfG/FX303Gvk+YU0spm2tsIKPl6AmV
 1CegDljzjycyfJbk418MQmMu2T82kjrkEofUO2a24ed3VGC0/Uz//XCR2ZTo+vBoBUQl41BD
 eFFtoCSrzo3yPFS+w5fkH9NT8ChdpSlbNS32NhYQhJtr9zjWyFRf0Zk+T/1P7ECn6gTEkp5k
 ofFIA4MFBc/fXbaDRtBmPB0N9pqTFApIUI4vuFPPO0JDrII9dLwZ6lO9EKiwuVlvr1wwzsgq
 zJTPBU3qHaUO4d/8G+gD7AL/6T4zi8Jo/GmjBsnYaTzbm94lf0CjXjsOX3seMhaE6WAZOQQG
 tZHAO1kAPWpaxne+wtgMKthyPLNwelLf+xzGvrIKvLX6QuLoWMnWldu22z2ICVnLQChlR9d6
 WW8QFEpo/FK7omuS8KvvopFcOOdlbFMM8Y/8vBgVMSsK6fsYUhruny/PahprPbYGiNIhKqz7
 UvgyZVl4pBFjTaz/SbimTk210vIlkDyy1WuS8Zsn0htv4+jQPgo9rqFE4mipJjy/iboDuQIN
 BFH7eUwBEAC2nzfUeeI8dv0C4qrfCPze6NkryUflEut9WwHhfXCLjtvCjnoGqFelH/PE9NF4
 4VPSCdvD1SSmFVzu6T9qWdcwMSaC+e7G/z0/AhBfqTeosAF5XvKQlAb9ZPkdDr7YN0a1XDfa
 +NgA+JZB4ROyBZFFAwNHT+HCnyzy0v9Sh3BgJJwfpXHH2l3LfncvV8rgFv0bvdr70U+On2XH
 5bApOyW1WpIG5KPJlDdzcQTyptOJ1dnEHfwnABEfzI3dNf63rlxsGouX/NFRRRNqkdClQR3K
 gCwciaXfZ7ir7fF0u1N2UuLsWA8Ei1JrNypk+MRxhbvdQC4tyZCZ8mVDk+QOK6pyK2f4rMf/
 WmqxNTtAVmNuZIwnJdjRMMSs4W4w6N/bRvpqtykSqx7VXcgqtv6eqoDZrNuhGbekQA0sAnCJ
 VPArerAZGArm63o39me/bRUQeQVSxEBmg66yshF9HkcUPGVeC4B0TPwz+HFcVhheo6hoJjLq
 knFOPLRj+0h+ZL+D0GenyqD3CyuyeTT5dGcNU9qT74bdSr20k/CklvI7S9yoQje8BeQAHtdV
 cvO8XCLrpGuw9SgOS7OP5oI26a0548M4KldAY+kqX6XVphEw3/6U1KTf7WxW5zYLTtadjISB
 X9xsRWSU+Yqs3C7oN5TIPSoj9tXMoxZkCIHWvnqGwZ7JhwARAQABiQIfBBgBAgAJBQJR+3lM
 AhsMAAoJEC7Z13T+cC21hPAQAIsBL9MdGpdEpvXs9CYrBkd6tS9mbaSWj6XBDfA1AEdQkBOn
 ZH1Qt7HJesk+qNSnLv6+jP4VwqK5AFMrKJ6IjE7jqgzGxtcZnvSjeDGPF1h2CKZQPpTw890k
 fy18AvgFHkVk2Oylyexw3aOBsXg6ukN44vIFqPoc+YSU0+0QIdYJp/XFsgWxnFIMYwDpxSHS
 5fdDxUjsk3UBHZx+IhFjs2siVZi5wnHIqM7eK9abr2cK2weInTBwXwqVWjsXZ4tq5+jQrwDK
 cvxIcwXdUTLGxc4/Z/VRH1PZSvfQxdxMGmNTGaXVNfdFZjm4fz0mz+OUi6AHC4CZpwnsliGV
 ODqwX8Y1zic9viSTbKS01ZNp175POyWViUk9qisPZB7ypfSIVSEULrL347qY/hm9ahhqmn17
 Ng255syASv3ehvX7iwWDfzXbA0/TVaqwa1YIkec+/8miicV0zMP9siRcYQkyTqSzaTFBBmqD
 oiT+z+/E59qj/EKfyce3sbC9XLjXv3mHMrq1tKX4G7IJGnS989E/fg6crv6NHae9Ckm7+lSs
 IQu4bBP2GxiRQ+NV3iV/KU3ebMRzqIC//DCOxzQNFNJAKldPe/bKZMCxEqtVoRkuJtNdp/5a
 yXFZ6TfE1hGKrDBYAm4vrnZ4CXFSBDllL59cFFOJCkn4Xboj/aVxxJxF30bn
Organization: Red Hat
Message-ID: <2545dd3e-f398-0e7a-0f82-fc340034a004@redhat.com>
Date: Fri, 18 Oct 2019 08:48:23 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <d803e58f-f0cc-b13b-6041-682497c6fe2f@redhat.com>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="GIK40EoU1vBedlPRb0KrewTAPhFsFGOak"
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
 (mx1.redhat.com [10.5.110.31]); Fri, 18 Oct 2019 06:48:38 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
X-Received-From: 209.132.183.28
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
Cc: Laurent Vivier <lvivier@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 qemu-devel@nongnu.org, "Michael S. Tsirkin" <mst@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--GIK40EoU1vBedlPRb0KrewTAPhFsFGOak
Content-Type: multipart/mixed; boundary="2CckmgdMNZWPrQhXlkwPYEodhV81Aousm";
 protected-headers="v1"
From: Thomas Huth <thuth@redhat.com>
To: Stefan Hajnoczi <stefanha@redhat.com>
Cc: Laurent Vivier <lvivier@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 qemu-devel@nongnu.org, "Michael S. Tsirkin" <mst@redhat.com>
Message-ID: <2545dd3e-f398-0e7a-0f82-fc340034a004@redhat.com>
Subject: Re: [PATCH v2 7/7] libqos: add VIRTIO PCI 1.0 support
References: <20191011085611.4194-1-stefanha@redhat.com>
 <20191011085611.4194-8-stefanha@redhat.com>
 <e7821640-de44-5e65-b9c1-2534dc676690@redhat.com>
 <20191017160735.GB1266@stefanha-x1.localdomain>
 <d803e58f-f0cc-b13b-6041-682497c6fe2f@redhat.com>
In-Reply-To: <d803e58f-f0cc-b13b-6041-682497c6fe2f@redhat.com>

--2CckmgdMNZWPrQhXlkwPYEodhV81Aousm
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable

On 17/10/2019 18.18, Thomas Huth wrote:
> On 17/10/2019 18.07, Stefan Hajnoczi wrote:
>> On Thu, Oct 17, 2019 at 04:52:54PM +0200, Thomas Huth wrote:
>>> On 11/10/2019 10.56, Stefan Hajnoczi wrote:
>>>> Implement the VIRTIO 1.0 virtio-pci interface.  The main change here=
 is
>>>> that the register layout is no longer a fixed layout in BAR 0.  Inst=
ead
>>>> we have to iterate of PCI Capabilities to find descriptions of where=

>>>> various registers are located.  The vring registers are also more
>>>> fine-grained, allowing for more flexible vring layouts, but we don't=

>>>> take advantage of that.
>>>>
>>>> Note that test cases do not negotiate VIRTIO_F_VERSION_1 yet and are=

>>>> therefore not running in VIRTIO 1.0 mode.
>>>>
>>>> Signed-off-by: Stefan Hajnoczi <stefanha@redhat.com>
>>>> ---
>>>>  tests/Makefile.include           |   1 +
>>>>  tests/libqos/virtio-pci-modern.h |  17 ++
>>>>  tests/libqos/virtio-pci.h        |  10 +
>>>>  tests/libqos/virtio-pci-modern.c | 412 ++++++++++++++++++++++++++++=
+++
>>>>  tests/libqos/virtio-pci.c        |   6 +-
>>>>  5 files changed, 445 insertions(+), 1 deletion(-)
>>>>  create mode 100644 tests/libqos/virtio-pci-modern.h
>>>>  create mode 100644 tests/libqos/virtio-pci-modern.c
>>> [...]
>>>> +static bool probe_device_type(QVirtioPCIDevice *dev)
>>>> +{
>>>> +    uint16_t vendor_id;
>>>> +    uint16_t device_id;
>>>> +
>>>> +    /* "Drivers MUST match devices with the PCI Vendor ID 0x1AF4" *=
/
>>>> +    vendor_id =3D qpci_config_readw(dev->pdev, PCI_VENDOR_ID);
>>>> +    if (vendor_id !=3D 0x1af4) {
>>>> +        return false;
>>>> +    }
>>>> +
>>>> +    /*
>>>> +     * "Any PCI device with ... PCI Device ID 0x1000 through 0x107F=
 inclusive
>>>> +     * is a virtio device"
>>>> +     */
>>>> +    device_id =3D qpci_config_readw(dev->pdev, PCI_DEVICE_ID);
>>>> +    if (device_id < 0x1000 || device_id > 0x107f) {
>>>> +        return false;
>>>> +    }
>>>> +
>>>> +    /*
>>>> +     * "Devices MAY utilize a Transitional PCI Device ID range, 0x1=
000 to
>>>> +     * 0x103F depending on the device type"
>>>> +     */
>>>> +    if (device_id < 0x1040) {
>>>> +        /*
>>>> +         * "Transitional devices MUST have the PCI Subsystem Device=
 ID matching
>>>> +         * the Virtio Device ID"
>>>> +         */
>>>> +        dev->vdev.device_type =3D qpci_config_readw(dev->pdev, PCI_=
SUBSYSTEM_ID);
>>>
>>> Shouldn't you return "false" here in case the device_type is 0 ? Whic=
h
>>> likely means that it is a legacy or broken device ...?
>>
>> The real decision whether to use this PCI device or not happens in
>> probe_device_layout().  If it's broken or a legacy device then that
>> function will fail.
>=20
> Ok, fair.
>=20
> I've added the patches to my qtest-next branch:
>=20
> https://gitlab.com/huth/qemu/tree/qtest-next

 Hi Stephan,

looks like this is breaking the virtio-blk-test in certain configurations=
:

 https://gitlab.com/huth/qemu/-/jobs/324085741

and:

 https://cirrus-ci.com/task/4511314474434560

Could you please have a look?

 Thanks,
  Thomas


--2CckmgdMNZWPrQhXlkwPYEodhV81Aousm--

--GIK40EoU1vBedlPRb0KrewTAPhFsFGOak
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEJ7iIR+7gJQEY8+q5LtnXdP5wLbUFAl2pYDwACgkQLtnXdP5w
LbWJgQ/+OceceplB9mj/FnwxMM+oGFOQIQBg48sePFyNtZt0INWtb/x8FLIas7eX
CCrj6gEsIc1iY328RDcLO32qffe4we6dd2if8u8l74EUJUuCIVaMCF2hR/Stn2lg
o1kHEzzHOF4gTd/WEEtzZJ2vFt/eynzmlJbOqYYuLGn4+AYq53EQajxQEObWzeUQ
0az1cr3Qr1Fb9A55cuchrkRf1gl4nKM2LyDQJFbvEjSzQxLZRAYm/NBIJYIqKh5u
kfyMjTycOK2mPCoNjKryRL7WVKmKhC6Evbjtvn/1mR6lJOrjyL/0dOFiXeXTSPeQ
AIrNrp2Xz7uyjEcetVsN5+MOOfLV5DHhv8kCQ+ECRXK+UvDBXTAhCLUqmUZaTm8J
4iGgjJ0MkrcAcI1ETiBBfIQj6ntadhTp8kMs/GbhKW+Dl+94bKgURnceqtbTBalU
n7qxelxs7NDbU5ShNW40kNMcll52aFU04VwIQeU2wqHAIeT/LbWfpWx0NQX7ITC7
VbIG7SnTFjI0100R51W4dGYSKdtHfr7gVepPeyhw/OIRRj6mmKIU/e4im3+mTGfw
gu6eyDOFiBJqf+prdpvdyQrABEd3J4/uAJeKVU02y3BxPeYfKfHlPt1PYhCiOxjk
RHjL8BEe/GAtCjaeKhD2pAkLv6Z3XAC1j+p0vdXTH9mOqV1qU3Y=
=lNMY
-----END PGP SIGNATURE-----

--GIK40EoU1vBedlPRb0KrewTAPhFsFGOak--

